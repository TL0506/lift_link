import SwiftUI
import MapKit

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var annotations = [MKPointAnnotation]()
    @StateObject private var viewModel = MapViewModel()
    @State private var showingPlaceDetails = false
    @State private var locationLabel = ""
    @State private var selectedPlace: MKPointAnnotation?

    var body: some View {
        
        NavigationStack {
            ZStack {
                Image("homepage")
                    .resizable(resizingMode: .stretch)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    HStack {
                        Image("homeicon")
                            .resizable(capInsets: EdgeInsets(top: 50.0, leading: 10.0, bottom: 0.0, trailing: 0.0))
                            .frame(width: 90, height: 125)
                        
                        Spacer()
                        NavigationLink(destination: Chat()) {
                            Image("chaticon")
                                .resizable(capInsets: EdgeInsets(top: 40.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .frame(width: 70, height: 120)
                        }
                        Spacer()
                        NavigationLink(destination: Leaderboard()) {
                            Image("leaderboard")
                                .resizable(capInsets: EdgeInsets(top: 40.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .frame(width: 80.0, height: 130.0)
                        }
                        Spacer()
                        NavigationLink(destination: MapView(centerCoordinate: $viewModel.centerCoordinate, annotations: $viewModel.annotations, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails)) {
                            Image("mapicon")
                                .resizable(capInsets: EdgeInsets(top: 40.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .frame(width: 90.0, height: 130.0)
                        }
                        Spacer()
                        NavigationLink(destination: SignIn()) {
                            Image("pfp")
                                .resizable(capInsets: EdgeInsets(top: 40.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .frame(width: 65.0, height: 120.0)
                            
                        }
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
