//
//  ContentView.swift
//  RememberMe
//
//  Created by Cem Bıçakcı on 24.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    @State private var showAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.people) { item in
                    NavigationLink {
                        PersonDetailView(person: item)
                    } label: {
                        HStack {
                            item.image?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationTitle("Remember Me")
            .sheet(isPresented: $showAddView) {
                AddPersonView()
                    .environmentObject(viewModel)
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
