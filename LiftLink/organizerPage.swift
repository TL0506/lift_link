//
//  organizerPage.swift
//  LiftLink
//
//  Created by Wang, Selina on 4/12/24.
//

import SwiftUI

struct organizerPage: View {
    var body: some View {
        @State var text = ""
        ZStack {
            Image(.organizer)
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea()
                .scaledToFill()
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 330, height: 65)
                .padding(.bottom, 200)
                .foregroundColor(.white)
            TextField("Enter Username...", text: $text, axis: .vertical)
                .padding(.bottom, 1)
                .frame(width: 290.0, height: 250.0)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 110.0)
                .lineLimit(10, reservesSpace: true)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 330, height: 65)
                .padding(.bottom)
                .foregroundColor(.white)
            TextField("Enter email...", text: $text, axis: .vertical)
                .padding(.top, 185)
                .frame(width: 290.0, height: 250.0)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 110.0)
                .lineLimit(10, reservesSpace: true)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 330, height: 65)
                .padding(.top, 180)
                .foregroundColor(.white)
            TextField("Enter password...", text: $text, axis: .vertical)
                .padding(.top, 375)
                .frame(width: 290.0, height: 250.0)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 110.0)
                .lineLimit(10, reservesSpace: true)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 330, height: 65)
                .padding(.top, 370)
                .foregroundColor(.white)
            TextField("Confirm password...", text: $text, axis: .vertical)
                .padding(.top, 565)
                .frame(width: 290.0, height: 250.0)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 110.0)
                .lineLimit(10, reservesSpace: true)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 170, height: 40)
                .padding(.top, 550)
                .foregroundColor(Color("DarkGreen"))
            Text("Sign up")
                .font(.system(size: 20))
                .padding(.top, 550)
                .fontWeight(.light)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    organizerPage()
}
