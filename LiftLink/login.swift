//
//  login.swift
//  LiftLink
//
//  Created by Wang, Selina on 4/12/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct login: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View{
        if userIsLoggedIn{
            ProfileView()
        }else{
           content
        }
    }
    var content: some View {
        ZStack {
            Image(.login)
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 330, height: 65)
                .padding(.bottom, 20)
                .foregroundColor(.white)
            TextField("Enter Email...", text: $email, axis: .vertical)
                .padding(.top, 175)
                .frame(width: 290.0, height: 250.0)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 110.0)
                .lineLimit(10, reservesSpace: true)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 330, height: 65)
                .padding(.top, 250)
                .foregroundColor(.white)
            SecureField("Enter Password...", text: $password)
                .padding(.top, 445)
                .frame(width: 290.0, height: 250.0)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 110.0)
                .lineLimit(10, reservesSpace: true)
                .padding(.bottom, 195)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 170, height: 40)
                .padding(.top, 440)
                .foregroundColor(Color("DarkGreen"))
            Text("Log in")
                .font(.system(size: 20))
                .padding(.top, 440)
                .fontWeight(.light)
                .foregroundColor(.white)
                .foregroundColor(.cyan)
            Button{
                login()
            } label: {
                Text("Log in")
                    .padding(.top, 440)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .onAppear(){
                Auth.auth().addStateDidChangeListener{
                    auth, user in
                    if user != nil{
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    login()
}
