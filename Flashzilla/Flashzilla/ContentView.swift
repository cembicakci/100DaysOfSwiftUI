//
//  ContentView.swift
//  Flashzilla
//
//  Created by Cem Bıçakcı on 11.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    @State private var currentAmount2 = 0.0
    @State private var finalAmount2 = 1.0

    
    var body: some View {
        Text("Hello, World!")
           .rotationEffect(currentAmount + finalAmount)
           .gesture(
               RotationGesture()
                   .onChanged { angle in
                       currentAmount = angle
                   }
                   .onEnded { angle in
                       finalAmount += currentAmount
                       currentAmount = .zero
                   }
           )
            
        Text("Hello, World!")
          .scaleEffect(finalAmount2 + currentAmount2)
          .gesture(
              MagnificationGesture()
                  .onChanged { amount in
                      currentAmount2 = amount - 1
                  }
                  .onEnded { amount in
                      finalAmount2 += currentAmount2
                      currentAmount2 = 0
                  }
          )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
