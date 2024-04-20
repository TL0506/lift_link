//
//  signUp1.swift
//  LiftLink
//
//  Created by Wang, Selina on 4/12/24.
//

import SwiftUI

struct signUp1: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image(.signup)
                    .resizable(resizingMode: .stretch)
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack {
                    NavigationLink(destination: volunteerPage()) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 300, height: 65)
                            .foregroundColor(Color("DarkGreen"))
                            .padding(.top, 60)
                    }
                    Text("Volunteer")
                        .font(.system(size: 29))
                        .fontWeight(.medium)
                        .padding(.bottom)
                        .foregroundColor(.white)
                        .offset(x: 0, y: -62)
                    NavigationLink(destination: organizerPage()) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 300, height: 65)
                            .foregroundColor(Color("DarkGreen"))
                    }
                    Text("Organization")
                        .font(.system(size: 29))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .offset(x: 0, y: -62)
                }
                
            }
        }
    }
}

#Preview {
    signUp1()
}
