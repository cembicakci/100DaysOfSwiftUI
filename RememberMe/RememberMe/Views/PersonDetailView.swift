//
//  PersonDetailView.swift
//  RememberMe
//
//  Created by Cem Bıçakcı on 29.09.2023.
//

import SwiftUI

struct PersonDetailView: View {
    var person: Person
    
    var body: some View {
        VStack {
            person.image?
                .resizable()
                .scaledToFit()
                    
        }
    }
}
