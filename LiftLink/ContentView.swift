import SwiftUI
import MapKit

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var annotations = [MKPointAnnotation]()

    var body: some View {
        NavigationStack {
            ZStack {
                MapView(centerCoordinate: $centerCoordinate, annotations: $annotations)
                    .ignoresSafeArea()
                
                Image("homepage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    HStack {
                        Image("homeicon")
                            .resizable()
                            .frame(width: 90, height: 125)
                        
                        Spacer()
                        NavigationLink(destination: Chat()) {
                            Image("chaticon")
                                .resizable()
                                .frame(width: 70, height: 120)
                        }
                        Spacer()
                        NavigationLink(destination: Leaderboard()) {
                            Image("leaderboard")
                                .resizable()
                                .frame(width: 80, height: 130)
                        }
                        Spacer()
                        NavigationLink(destination: Map()) {
                            Image("mapicon")
                                .resizable()
                                .frame(width: 90, height: 130)
                        }
                        Spacer()
                        NavigationLink(destination: SignIn()) {
                            Image("pfp")
                                .resizable()
                                .frame(width: 65, height: 120)
                            
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
