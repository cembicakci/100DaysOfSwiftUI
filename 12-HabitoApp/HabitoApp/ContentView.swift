//
//  ContentView.swift
//  HabitoApp
//
//  Created by Cem Bıçakcı on 22.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var data = Activities()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationView {
            List (data.activities) { activity in
                NavigationLink {
                    Text("Detail View")
                } label: {
                    HStack {
                        Text(activity.title)
                        Spacer()
                        Text(String(activity.completionCount))
                    }
                }
            }
            .navigationTitle("Habito")
            .toolbar {
                Button {
                    addingNewActivity.toggle()
                } label: {
                    Label("Add New Activity", systemImage: "plus")
                }
            }
            .sheet(isPresented: $addingNewActivity) {
                AddActivity(data: data)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
