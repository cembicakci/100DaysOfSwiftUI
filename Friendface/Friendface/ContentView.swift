//
//  ContentView.swift
//  Friendface
//
//  Created by Cem Bıçakcı on 3.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink {
                    Text(user.name)
                } label: {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 30)
                        
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("Friendface")
            .task {
                await fetchUsers()
            }
        }
    }
    
    func fetchUsers() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Download failed")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
