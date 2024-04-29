//
//  MapView.swift
//  Assignment3
//
//  Created by Adam Butler on 3/30/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate : CLLocationCoordinate2D
    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, latitudinalMeters: 750, longitudinalMeters: 750)))
    }
}
