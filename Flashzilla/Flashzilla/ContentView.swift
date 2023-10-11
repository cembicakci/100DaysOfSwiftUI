//
//  ContentView.swift
//  Flashzilla
//
//  Created by Cem Bıçakcı on 11.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        CardView(card: Card.example)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
