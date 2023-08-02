//
//  ContentView.swift
//  UnitConversion
//
//  Created by Cem Bıçakcı on 2.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    let units = ["Celcius", "Fahrenheit", "Kelvin"]

    @State private var selectedUnit = 0
    @State private var convertedUnit = 0
    @State private var inputValue = 0.0
    
    var calculate: Double {
                
        if(selectedUnit == 0 && convertedUnit == 0){
            //celcius to celcius
            return inputValue
            
        }else if(selectedUnit == 0 && convertedUnit == 1){
            //celcius to fahrenheit
            return (inputValue * 9/5 + 32)
            
        } else if(selectedUnit == 0 && convertedUnit == 2){
            //celciues to kelvin
            return (inputValue + 273.15)
            
        } else if(selectedUnit == 1 && convertedUnit == 0){
            //fahrenheit to celcius
            return ((inputValue - 32) * 5/9)
            
        } else if(selectedUnit == 1 && convertedUnit == 1){
            //fahrenheit to fahrenhiet
            return inputValue
            
        } else if(selectedUnit == 1 && convertedUnit == 2){
            //fahrenheit to celvin
            return ((inputValue - 32) * 5/9 + 273.15)
            
        } else if(selectedUnit == 2 && convertedUnit == 0){
            //kelvin to celcius
            return (inputValue - 273.15)
            
        } else if(selectedUnit == 2 && convertedUnit == 1){
            //kelvin to fahrenheit
            return ((inputValue - 273.15) * 9/5 + 32)
            
        } else if(selectedUnit == 2 && convertedUnit == 2){
            //kelvin to kelvin
            return inputValue
        }
            
        return 0
    }
    
    var body: some View {
       
        NavigationView {
            
            Form {
                
                Section {
                    Picker("Select", selection: $selectedUnit) {
                        ForEach(0 ..< units.count, id: \.self) { item in
                            Text(units[item])
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("From which unit do you want to convert?")
                }
                
                Section {
                    Picker("", selection: $convertedUnit) {
                        ForEach(0 ..< units.count, id: \.self) { item in
                            Text(units[item])
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To which unit do you want to convert?")
                }
                
                Section {
                    TextField("Value", value: $inputValue, format: .number)
                } header: {
                    Text("Enter your value")
                }
                
                Section {
                    Text("Result: \(calculate, specifier: "%0.2f")")
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
