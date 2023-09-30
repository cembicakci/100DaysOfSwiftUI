//
//  ContentView.swift
//  HotProspects
//
//  Created by Cem Bıçakcı on 30.09.2023.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Cem Bıçakcı"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    var body: some View {
        Text(user.name)
    }
}

struct ContentView: View {
    @StateObject private var user = User()
    @State private var selectedTab = "One"
    
    var body: some View {
            TabView(selection: $selectedTab) {
                EditView()
                    .onTapGesture {
                        selectedTab = "Two"
                    }
                    .tabItem {
                        Label("One", systemImage: "star")
                    }
                    .tag("One")
                DisplayView()
                    .tabItem {
                        Label("Two", systemImage: "star")
                    }
                    .tag("Two")
            }
            .environmentObject(user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
