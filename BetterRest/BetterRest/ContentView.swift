//
//  ContentView.swift
//  BetterRest
//
//  Created by Cem Bıçakcı on 5.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
