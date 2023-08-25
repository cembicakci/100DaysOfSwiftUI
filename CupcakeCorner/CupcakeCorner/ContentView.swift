//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Cem Bıçakcı on 25.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loaging image")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
