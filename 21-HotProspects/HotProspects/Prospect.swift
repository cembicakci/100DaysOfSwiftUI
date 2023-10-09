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
    @Published private(set) var people: [Prospect]
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        //no saved data
        people = []
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
            
    }
}
