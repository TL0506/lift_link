//
//  login.swift
//  LiftLink
//
//  Created by Wang, Selina on 4/12/24.
//

import SwiftUI

struct login: View {
    @State var text = ""
    var body: some View {
        ZStack {
            Image(.login)
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 330, height: 65)
                .padding(.bottom, 20)
                .foregroundColor(.white)
            TextField("Enter Username...", text: $text, axis: .vertical)
                .padding(.top, 175)
                .frame(width: 290.0, height: 250.0)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 110.0)
                .lineLimit(10, reservesSpace: true)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 330, height: 65)
                .padding(.top, 250)
                .foregroundColor(.white)
            TextField("Enter Password...", text: $text, axis: .vertical)
                .padding(.top, 445)
                .frame(width: 290.0, height: 250.0)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 110.0)
                .lineLimit(10, reservesSpace: true)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 170, height: 40)
                .padding(.top, 440)
                .foregroundColor(.cyan)
            Text("Log in")
                .padding(.top, 440)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    login()
}
