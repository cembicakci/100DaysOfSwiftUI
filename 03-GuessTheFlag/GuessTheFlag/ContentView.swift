//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Cem Bıçakcı on 3.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
       
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                        Text("Tap the flag of")
                            .foregroundColor(Color.white)
                        Text(countries[correctAnswer])
                            .foregroundColor(Color.white)
                }
                
                ForEach(0..<3){ number in
                    Button {
                        //flag
                    }label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
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
