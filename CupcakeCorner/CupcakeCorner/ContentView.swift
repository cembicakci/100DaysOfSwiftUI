//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Cem Bıçakcı on 25.08.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = SharedOrder()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(SharedOrder.types.indices) {
                            Text(SharedOrder.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...30)
                }
                
                Section {
                    Toggle("Any special requests", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting.animation())
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles.animation())
                    }
                }
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
