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
            List {
                ForEach(data.activities) { activity in
                    NavigationLink {
                        ActivityView(data: data, activity: activity)
                    } label: {
                        HStack {
                            Text(activity.title)
                            Spacer()
                            Text(String(activity.completionCount))
                                .font(.caption.weight(.black))
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: activity))
                                .clipShape(Capsule())
                        }
                    }
                }
                .onDelete(perform: deleteActivity)
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
    
    
    func color(for activity: Activity) -> Color {
        if activity.completionCount < 3 {
            return .red
        } else if activity.completionCount < 10 {
            return .orange
        } else if activity.completionCount < 20 {
            return .green
        } else if activity.completionCount < 50 {
            return .blue
        } else {
            return .indigo
        }
    }
    
    func deleteActivity(at offsets: IndexSet) {
        data.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
