//
//  ContentView.swift
//  HotProspects
//
//  Created by Cem Bıçakcı on 30.09.2023.
//

import SwiftUI

@MainActor class DeleteUpdate: ObservableObject {
    @Published var value = 0
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ContentView: View {
    @StateObject private var updater = DeleteUpdate()
    
    @State private var output = ""
    
    var body: some View {
        Text("Value is \(updater.value)")
        
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let reading = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(reading.count) reading."
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Error: \(error.localizedDescription)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
