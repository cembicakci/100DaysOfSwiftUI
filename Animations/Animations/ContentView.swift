//
//  ContentView.swift
//  Animations
//
//  Created by Cem Bıçakcı on 8.08.2023.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello, SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .red)
                        .offset(dragAmount)
                        .animation(
                            .default.delay(Double(num) / 20),
                            value: dragAmount
                        )
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        dragAmount = .zero
                        enabled.toggle()
                    }
            )
        
            Spacer()
        
            VStack {
                Button("Tap Me") {
                    withAnimation {
                        isShowingRed.toggle()
                    }
                }
                
                if (isShowingRed) {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
