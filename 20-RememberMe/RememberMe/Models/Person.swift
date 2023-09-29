//
//  Person.swift
//  RememberMe
//
//  Created by Cem Bıçakcı on 24.09.2023.
//

import MapKit
import SwiftUI

struct Person: Codable, Comparable, Identifiable {
    var id = UUID()
    let name: String
    let imageData: Data
    
    var latitude: Double? = nil
    var longitude: Double? = nil
    
    var image: Image? {
        let uiImage = UIImage(data: imageData)
        
        guard let uiImage = uiImage else { return  nil }
        
        return Image(uiImage: uiImage)
    }
    
    var coordinate: CLLocationCoordinate2D? {
        guard let latitude = latitude else { return nil }
        guard let longitude = longitude else { return nil }
        
        return .init(latitude: latitude, longitude: longitude)
    }
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}
