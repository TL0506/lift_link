import SwiftUI
import MapKit

struct ContentView1: View {
    @StateObject private var viewModel = MapViewModel(centerCoordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
    @State private var showingPlaceDetails = false
    @State private var locationLabel = ""
    @State private var selectedPlace: MKPointAnnotation?

    var body: some View {
        NavigationView {
            ZStack {
                MapView(centerCoordinate: $viewModel.centerCoordinate, annotations: $viewModel.annotations, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails)
                    .onAppear {
                        let initialAnnotation = MKPointAnnotation()
                        initialAnnotation.coordinate = viewModel.centerCoordinate
                        initialAnnotation.title = "Unknown place"
                        viewModel.annotations.append(initialAnnotation)
                    }

                if showingPlaceDetails {
                    VStack {
                        TextField("Location label", text: $locationLabel)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        NavigationLink(destination: Survey()) {
                            Text("Save")
                        }
                        .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
                }
            }
            .navigationTitle("Map")
        }
    }
}
#Preview {
    ContentView1()
}
