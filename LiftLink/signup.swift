//
//  signup.swift
//  LiftLink
//
//  Created by Tiffany Lin on 4/22/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct signup: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        ZStack {
            Image(.signup)
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
            TextField("Enter Password...", text: $password, axis: .vertical)
                .padding(.top, 445)
                .frame(width: 290.0, height: 250.0)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 110.0)
                .lineLimit(10, reservesSpace: true)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 170, height: 40)
                .padding(.top, 440)
                .foregroundColor(.cyan)
            Button{
                register()
            } label: {
                Text("Sign up")
                    .padding(.top, 440)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
            }
            
            
        }
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
}
    


#Preview {
    signup()
}
