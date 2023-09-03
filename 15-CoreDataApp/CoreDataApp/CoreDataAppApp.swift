//
//  CoreDataAppApp.swift
//  CoreDataApp
//
//  Created by Cem Bıçakcı on 2.09.2023.
//

import SwiftUI

@main
struct CoreDataAppApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)

        }
    }
}
