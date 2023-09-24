//
//  ContentView.swift
//  RememberMe
//
//  Created by Cem Bıçakcı on 24.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddView = false
    
    var body: some View {
        NavigationView {
            Text("Hello")
                .navigationTitle("Remember Me")
                .sheet(isPresented: $showAddView) {
                    AddPersonView()
                }
                .toolbar {
                    Button {
                        showAddView = true
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
