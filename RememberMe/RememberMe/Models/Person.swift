//
//  Person.swift
//  RememberMe
//
//  Created by Cem Bıçakcı on 24.09.2023.
//

import Foundation
import SwiftUI

struct Person: Codable, Identifiable {
    var id = UUID()
    let name: String
    let imageData: Data
    
    var image: Image? {
        let uiImage = UIImage(data: imageData)
        
        guard let uiImage = uiImage else { return  nil }
        
        return Image(uiImage: uiImage)
    }
}
