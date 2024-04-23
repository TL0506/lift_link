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
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 170, height: 40)
                    .padding(.top)
                    .foregroundColor(.darkGreen)
               
                NavigationLink(destination: signup()){
                    Text("Sign Up")
                        .padding(.top)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 170, height: 40)
                    .padding(.top,200)
                    .foregroundColor(.darkGreen)
           
                NavigationLink(destination: login()){
                    Text("Log in")
                        .padding(.top, 200)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    SignIn()
}
