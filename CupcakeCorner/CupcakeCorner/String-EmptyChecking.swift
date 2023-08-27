//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Cem Bıçakcı on 27.08.2023.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
