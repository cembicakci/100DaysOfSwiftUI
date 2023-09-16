//
//  Location.swift
//  BucketList
//
//  Created by Cem Bıçakcı on 16.09.2023.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
}
