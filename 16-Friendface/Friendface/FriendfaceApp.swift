//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Cem Bıçakcı on 3.09.2023.
//

import SwiftUI

@main
struct FriendfaceApp: App {
    @StateObject var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
