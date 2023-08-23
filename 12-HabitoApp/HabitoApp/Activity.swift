//
//  Activity.swift
//  HabitoApp
//
//  Created by Cem Bıçakcı on 23.08.2023.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Activity(title: "Example", description: "This is an example")
}
