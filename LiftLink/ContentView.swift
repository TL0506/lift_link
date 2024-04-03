//
//  ContentView.swift
//  LiftLink
//
//  Created by Tiffany Lin on 3/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            
            ZStack{
                
                Image(.homepage)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .ignoresSafeArea()
                
                Button(action: {
                    NavigationLink(destination:SignIn())
                }) {
                    Image(.pfp)
                        .resizable()
                        .edgesIgnoringSafeArea(.top)
                        .frame(width: 60, height: 60)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
