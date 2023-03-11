//
//  ChitChatApp.swift
//  ChitChat
//
//  Created by Sayor Debbarma on 10/03/23.
//

import SwiftUI
import Firebase

@main
struct ChitChatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
