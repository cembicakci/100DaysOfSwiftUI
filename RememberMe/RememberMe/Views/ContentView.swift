//
//  ContentView.swift
//  RememberMe
//
//  Created by Cem Bıçakcı on 24.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Hello")
                .navigationTitle("Remember Me")
                .toolbar {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
