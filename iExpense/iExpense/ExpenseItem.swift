//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Cem Bıçakcı on 12.08.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
