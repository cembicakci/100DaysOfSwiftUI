//
//  Expenses.swift
//  iExpense
//
//  Created by Cem Bıçakcı on 12.08.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
