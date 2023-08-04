//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Cem Bıçakcı on 3.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var showingResult = false
    @State private var scoreTitle = ""
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var count = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    var body: some View {
       
        ZStack {
           RadialGradient(stops: [
            .init(color: Color.blue, location: 0.3),
            .init(color: Color.red, location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            
            
            VStack {
                
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            Text(countries[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                    }
             
                    ForEach(0..<3){ number in
                        Button {
                            flagTapped(number)
                        }label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
           Text("Your Score is \(score)")
        }
        
        .alert("Game is Over", isPresented: $showingResult) {
            Button("Restart", action: resetGame)
        } message: {
           Text("Your Total Score is \(score)")
        }
    }
    

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score = score + 20
            scoreTitle = "Correct"
        }else {
            score = score - 20
            scoreTitle = "Wrong. That is the flag of \(countries[number])"
        }
        count = count + 1
        showingScore = true
        
        if(count == 8){
            showingResult = true
        }
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        showingScore = false
        showingResult = false
        score = 0
        count = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
