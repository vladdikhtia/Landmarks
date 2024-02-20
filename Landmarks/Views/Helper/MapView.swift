//
//  MapView.swift
//  Landmarks
//
//  Created by Vladyslav Dikhtiaruk on 20/02/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
    //This new initializer expects a Binding to a position, which is a bidirectional connection to the value. Use a .constant() binding here because MapView doesn’t need to detect when someone changes the position by interacting with the map.
    var body: some View {
        Map(position: .constant(.region(region)))
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
