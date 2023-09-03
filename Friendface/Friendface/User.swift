//
//  User.swift
//  Friendface
//
//  Created by Cem Bıçakcı on 3.09.2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    static let example = User(id: UUID(), isActive: true, name: "Cem Bıçakcı", age: 27, company: "Codelisa", email: "cmbicakci@gmail.com", address: "İstanbul", about: "Learning swiftui", registered: Date.now, tags: ["swift", "swiftui"], friends: [])
}
