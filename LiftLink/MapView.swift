import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var annotations: [MKPointAnnotation]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        context.coordinator.mapView = mapView // Store a reference to the map view
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        // If you need to make changes to the map view when the view updates, do it here
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        var parent: MapView
        weak var mapView: MKMapView? // Make it weak to avoid retain cycles
        let locationManager = CLLocationManager()

        init(_ parent: MapView) {
            self.parent = parent
            super.init()
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
        }

        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .notDetermined:
                manager.requestWhenInUseAuthorization()
            case .authorizedWhenInUse, .authorizedAlways:
                manager.startUpdatingLocation()
            case .restricted, .denied:
                // Location services are restricted or denied. Handle accordingly.
                break
            default:
                break
            }

            // For iOS 14 and above
            if #available(iOS 14.0, *), manager.accuracyAuthorization != .fullAccuracy {
                // Request temporary full accuracy authorization.
                manager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "YourPurposeKeyHere")
            }
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                DispatchQueue.main.async {
                    self.parent.centerCoordinate = location.coordinate // Update the binding
                    let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    self.mapView?.setRegion(region, animated: true)
                }
            }
        }
    }
}
