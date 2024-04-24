import SwiftUI
import MapKit

struct ContentView1: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var showingPlaceDetails = false
    @State private var locationLabel = ""
    @State private var selectedPlace: MKPointAnnotation?

    var body: some View {
        ZStack {
            MapView(centerCoordinate: $viewModel.centerCoordinate, annotations: $viewModel.annotations, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails)
                .onAppear {
                    if let centerCoordinate = viewModel.centerCoordinate {
                        let initialAnnotation = MKPointAnnotation()
                        initialAnnotation.coordinate = centerCoordinate
                        initialAnnotation.title = "Unknown place"
                        viewModel.annotations.append(initialAnnotation)
                    }
                }

            if showingPlaceDetails {
                VStack {
                    TextField("Location label", text: $locationLabel)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button("Save") {
                        if let selectedPlace = selectedPlace {
                            selectedPlace.title = locationLabel
                            showingPlaceDetails = false
                            locationLabel = ""
                        }
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
            }
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}

