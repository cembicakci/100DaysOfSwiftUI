//
//  ContentView.swift
//  BetterRest
//
//  Created by Cem Bıçakcı on 5.08.2023.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Picker("Daily coffee intake", selection: $coffeeAmount) {
                        ForEach(1..<21, id:\.self) {
                            Text($0, format: .number)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                .navigationTitle("BetterRest")
                
                Section {
                    Text("\(calculateBedTime)")
                        .font(.subheadline)
                } header: {
                    Text("Recommended bed time ")
                }
            }
        }
        
    }
    
    
    var calculateBedTime: String{
        var message: String
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            message = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            message = "Sorry, there was a problem calculating your bedtime."
        }
        
        //showingAlert = true
        return message
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
