//
//  LiftLinkApp.swift
//  LiftLink
//
//  Created by Tiffany Lin on 3/13/24.
//

import SwiftUI
import Firebase

@main
struct LiftLInkApp: App {
    init(){
        FirebaseApp.configure()
    }
  
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}
