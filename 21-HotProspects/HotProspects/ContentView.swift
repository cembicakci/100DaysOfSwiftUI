//
//  ContentView.swift
//  HotProspects
//
//  Created by Cem Bıçakcı on 30.09.2023.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red") {
                        backgroundColor = .red
                    }
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
            
            List {
                Text("Taylor Swift")
                   .swipeActions {
                       Button(role: .destructive) {
                           print("Hi")
                       } label: {
                           Label("Delete", systemImage: "minus.circle")
                       }
                   }
                   .swipeActions(edge: .leading) {
                       Button {
                           print("Hi")
                       } label: {
                           Label("Pin", systemImage: "pin")
                       }
                       .tint(.orange)
                   }
            }
            
            VStack {
                Button("Request Permission") {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }

                Button("Schedule Notification") {
                    let content = UNMutableNotificationContent()
                    content.title = "Feed the cat"
                    content.subtitle = "It looks hungry"
                    content.sound = UNNotificationSound.default

                    // show this notification five seconds from now
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                    // choose a random identifier
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                    // add our notification request
                    UNUserNotificationCenter.current().add(request)
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
