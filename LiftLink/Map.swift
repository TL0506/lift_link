//
//  Map.swift
//  LiftLink
//
//  Created by Tiffany Lin on 4/7/24.
//

import SwiftUI
import MapKit
struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea()
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

