//
//  SignIn.swift
//  LiftLink
//
//  Created by Tiffany Lin on 4/2/24.
//

import SwiftUI
import Firebase
struct SignIn: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Image(.account)
                    .resizable(resizingMode: .stretch)
                    .ignoresSafeArea()
                VStack {
                    NavigationLink(destination: signUp1()) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 180, height: 50)
                            .foregroundColor(Color("DarkGreen"))
                            .padding(.top, 60)
                    }
                    Text("Sign up")
                        .font(.system(size: 29))
                        .padding(.bottom)
                        .foregroundColor(.white)
                        .offset(x: 0, y: -52)
                    
                    NavigationLink(destination: login()) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 180, height: 50)
                            .foregroundColor(Color("DarkGreen"))
                    }
                    Text("Log in")
                        .font(.system(size: 29))
                        .foregroundColor(.white)
                        .offset(x: 0, y: -52)
                    
                }
            }
        }
    }
}

#Preview {
    SignIn()
}
