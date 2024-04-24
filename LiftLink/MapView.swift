import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var annotations: [MKPointAnnotation]
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails: Bool
    var locationManager = CLLocationManager()

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
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

        init(_ parent: MapView) {
            self.parent = parent
            super.init()
            parent.locationManager.delegate = self
            parent.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            parent.locationManager.requestWhenInUseAuthorization()
            parent.locationManager.startUpdatingLocation()
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "CustomPin"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.pinTintColor = .red
                annotationView?.isDraggable = true
            } else {
                annotationView?.annotation = annotation
            }
            return annotationView
        }

        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
            if newState == .ending {
                guard let draggedAnnotation = view.annotation as? MKPointAnnotation else { return }
                parent.centerCoordinate = draggedAnnotation.coordinate
                parent.selectedPlace = draggedAnnotation
                parent.showingPlaceDetails = true
            }
        }
    }
}
