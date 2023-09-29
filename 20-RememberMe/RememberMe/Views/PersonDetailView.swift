//
//  PersonDetailView.swift
//  RememberMe
//
//  Created by Cem Bıçakcı on 29.09.2023.
//

import MapKit
import SwiftUI

struct PersonDetailView: View {
    var person: Person
    
    var body: some View {
        VStack {
            person.image?
                .resizable()
                .scaledToFit()
                
            if let coordinate = person.coordinate {
                VStack {
                    Label("Saved Location", systemImage: "map")
                        .font(.headline)
                    
                    Map(coordinateRegion: .constant(MKCoordinateRegion(center: .init(latitude: coordinate.latitude, longitude: coordinate.longitude), span: .init(latitudeDelta: 0.25, longitudeDelta: 0.25))), annotationItems: [person]) { _ in
                        MapAnnotation(coordinate: coordinate) {
                            Circle()
                                .stroke(.primary, lineWidth: 3)
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            } else {
                Label("Unsaved Location", systemImage: "questionmark")
                    .font(.headline)
            }
        }
        .padding()
        .navigationTitle(person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
