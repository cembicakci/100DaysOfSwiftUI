//
//  Person.swift
//  RememberMe
//
//  Created by Cem Bıçakcı on 24.09.2023.
//

import SwiftUI

struct Person: Codable, Comparable, Identifiable {
    var id = UUID()
    let name: String
    let imageData: Data
    
    var image: Image? {
        let uiImage = UIImage(data: imageData)
        
        guard let uiImage = uiImage else { return  nil }
        
        return Image(uiImage: uiImage)
    }
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}
