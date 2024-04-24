import SwiftUI
import MapKit

class MapViewModel: ObservableObject {
    @Published var centerCoordinate: CLLocationCoordinate2D
    @Published var annotations: [MKPointAnnotation]

    init(centerCoordinate: CLLocationCoordinate2D, annotations: [MKPointAnnotation] = []) {
        self.centerCoordinate = centerCoordinate
        self.annotations = annotations
    }
}
