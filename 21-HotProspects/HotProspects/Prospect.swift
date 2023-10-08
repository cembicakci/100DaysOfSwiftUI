//
//  Prospect.swift
//  HotProspects
//
//  Created by Cem Bıçakcı on 3.10.2023.
//

import SwiftUI

// fileprivate(set), which means “this property can be read from anywhere, but only written from the current file”
class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
    
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        people = []
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
