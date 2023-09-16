//
//  ContentView.swift
//  BucketList
//
//  Created by Cem Bıçakcı on 15.09.2023.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var mapRegion  = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    @State private var locations = [Location]()

    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) {location in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
            }
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                        let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                        
                        locations.append(newLocation)
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding(20)
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding()
                }
            }
        }
        .ignoresSafeArea()

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
