//
//  Location.swift
//  BucketList
//
//  Created by Cem Bıçakcı on 16.09.2023.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = Location(id: UUID(), name: "Buckingham Palace", description: "Where Queen Elizabeth lives with her dorgis", latitude: 51.501, longitude: -0.141)
    
    //left-hand-side
    //right-hand-side
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
