import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var annotations: [MKPointAnnotation]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        context.coordinator.setMapView(mapView) // Pass the map view to the coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        // If you need to make changes to the map view when the view updates, do it here
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        var parent: MapView
        var locationManager = CLLocationManager()
        weak var mapView: MKMapView? // Add this property to hold the MKMapView reference

        init(_ parent: MapView) {
            self.parent = parent
            super.init()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        }

        func setMapView(_ mapView: MKMapView) { // Add this function to set the map view
            self.mapView = mapView
        }

        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .notDetermined, .restricted, .denied:
                // Do nothing if not determined, restricted, or denied
                break
            case .authorizedWhenInUse, .authorizedAlways:
                manager.startUpdatingLocation() // Start updating location
            @unknown default:
                break
            }

            // For iOS 14 and above, check if you need to request temporary full accuracy
            if #available(iOS 14.0, *), manager.accuracyAuthorization != .fullAccuracy {
                manager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "Privacy - Location When In Use Usage Description")
            }
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.parent.centerCoordinate = location.coordinate
                let region = MKCoordinateRegion(
                    center: location.coordinate,
                    latitudinalMeters: 1000,
                    longitudinalMeters: 1000
                )
            }
        }
    }
}
