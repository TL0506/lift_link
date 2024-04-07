//
//  ContentView.swift
//  LiftLink
//
//  Created by Tiffany Lin on 3/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {

            ZStack {
                Image(.homepage)
                    .resizable(resizingMode: .stretch)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    HStack {
                        Image(.homeicon)
                                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .frame(width: 100,
                                     height: 100)
                    
                        Spacer()
                        NavigationLink(destination: Chat()) {
                            Image(.chaticon)
                                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .frame(width: 100, height: 100)
                        }
                        Spacer()
                        NavigationLink(destination: Leaderboard()) {
                            Image(.leaderboard)
                                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .frame(width: 80.0, height: 70.0)
                        }
                        Spacer()
                        NavigationLink(destination: Map()) {
                            Image(.mapicon)
                                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .frame(width: 75.0, height: 50.0)
                        }
                        Spacer()
                        NavigationLink(destination: SignIn()) {
                            Image(.pfp)
                                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .frame(width: 50.0, height: 50.0)
                            
                        }
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.leading)



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
