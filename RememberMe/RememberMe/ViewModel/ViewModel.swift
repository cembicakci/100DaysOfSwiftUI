//
//  ViewModel.swift
//  RememberMe
//
//  Created by Cem Bıçakcı on 27.09.2023.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var people: [Person]
       
    let savePath = FileManager.documentDirectory.appendingPathComponent("SavedPersons")
   
    init() {
       // Get data from disk
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Person].self, from: data).sorted()
        } catch {
            people = []
       }
        
    }
       
    func addPerson(_ person: Person) {
        people.append(person)
        savePerson()
    }
    
    func savePerson() {
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func removePerson(at offsets: IndexSet) {
        people.remove(atOffsets: offsets)
        savePerson()
    }
}
