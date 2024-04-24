//
//  profile.swift
//  LiftLink
//
//  Created by Michelle Zhu on 4/24/24.
//

import SwiftUI

struct Profile: View {
    let avatars = ["👩", "👨", "👧", "👦", "👶", "👵", "👴", "🧑‍🦰", "🧑‍🦱", "🧑‍🦳", "🧑‍🦲"]
    let authenticatedUsername: String
    @State private var avatarIndex: Int
    
    init(authenticatedUsername: String) {
        self.authenticatedUsername = authenticatedUsername
        _avatarIndex = State(initialValue: Int.random(in: 0..<avatars.count))
    }
    
    var body: some View {
        VStack {
            Text(avatars[avatarIndex])
                .font(.largeTitle)
            Text(authenticatedUsername)
                .font(.title)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(authenticatedUsername: "Alice") // Provide a sample authenticated username for preview
    }
}
