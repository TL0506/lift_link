//
//  LiftLinkApp.swift
//  LiftLink
//
//  Created by Tiffany Lin on 3/13/24.
//

import SwiftUI
import Firebase // Don't forget to import Firebase

@main
struct LiftLinkApp: App {
    init(){
        FirebaseApp.configure()
    }
  
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView() // Make sure ContentView is implemented correctly
            }
        }
    }
}
