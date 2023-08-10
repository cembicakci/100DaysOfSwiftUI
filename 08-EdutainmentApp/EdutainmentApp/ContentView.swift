//
//  ContentView.swift
//  EdutainmentApp
//
//  Created by Cem Bıçakcı on 9.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var settingMode = true
    @State private var gameMode = false
    
    @State private var multiplacationTable = 2
    @State private var howManyQuestion = 0
    
    @State private var randomNumber = Int.random(in: 0...12)
    @State private var correctAnswer = 0
    
    @State private var answer = 0
    @State private var count = 0
    @State private var score = 0
    
    @State private var gameOver = false
    
    let questions = [5, 10, 20]
    
    var body: some View {
      
        NavigationView {
            
            ZStack {
                VStack {
                    
                    Form {
                        Section {
                            Stepper(value: $multiplacationTable, in: 2...12, step: 1) {
                                Text("\(multiplacationTable)")
                            }
                        } header: {
                            Text("Multıplıcatıon Table")
                        }
                        
                        Section {
                            Picker("Select?", selection: $howManyQuestion) {
                                ForEach(0..<questions.count, id: \.self) {
                                    Text("\(self.questions[$0])")
                                }
                            }
                            .pickerStyle(.segmented)
                        } header: {
                            Text("How many questıon?")
                        }
                                            
                    }
                    .frame(maxHeight: 250)
                    .navigationTitle("Edutainment")
                    
                    Button {
                        startGame()
                    } label: {
                        Text("Start")
                    }
                    
                  
                                
                }
                .opacity(settingMode ? 1 : 0)
                
                
                VStack {
                                        
                    Form {
                        Text("What is \(multiplacationTable) x \(randomNumber) ?")
                        
                        Section {
                            TextField ("", value: $answer, format: .number)
                        } header: {
                            Text("Your answer")
                        }
                        
                    }
                    .frame(maxHeight: 250)
                    
                    Button {
                        checkResult()
                    } label: {
                        Text("Answer")
                    }
                    
                }
                .opacity(gameMode ? 1 : 0)
                .alert("Game over", isPresented: $gameOver) {
                    Button("Restart"){
                        restartGame()
                    }
                } message: {
                    Text("Your Score is \(score)")
                }
            }
        }
        
    }
    
    func startGame(){
        settingMode = false
        gameMode = true
        
        count = count + 1
        correctAnswer = randomNumber * multiplacationTable
    }
    
    func checkResult(){
        if(count < questions[howManyQuestion]){
            if(answer == correctAnswer){
                score = score + 10
            } else {
                score = score - 10
            }
            
            randomNumber = Int.random(in: 0...12)
            correctAnswer = randomNumber * multiplacationTable
            count = count + 1
            answer = 0
        } else {
            if(answer == correctAnswer){
                score = score + 10
            } else {
                score = score - 10
            }
            
            gameOver = true
        }
    }
    
    func restartGame(){
        settingMode = true
        gameMode = false
        score = 0
        answer = 0
        count = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
