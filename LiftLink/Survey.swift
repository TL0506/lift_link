//
//  Survey.swift
//  LiftLink
//
//  Created by Wang, Selina on 4/24/24.
//

import SwiftUI

struct Survey: View {
    @State private var name = ""
    @State private var date = ""
    @State private var time = ""
    @State private var information = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.survey)
                    .resizable(resizingMode: .stretch)
                    .ignoresSafeArea()
                    TextField("Enter Name...", text: $name, axis: .vertical)
                        .padding(.bottom, 220)
                        .padding(.leading, 60)
                        .frame(width: 290.0, height: 250.0)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 110.0)
                        .lineLimit(10, reservesSpace: true)
                    TextField("Enter Date...", text: $date, axis: .vertical)
                        .padding(.top, 70)
                        .offset(x: -32, y: 0)
                        .frame(width: 290.0, height: 250.0)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 110.0)
                        .lineLimit(10, reservesSpace: true)
                    TextField("Enter time...", text: $time, axis: .vertical)
                        .padding(.top, 410)
                        .offset(x: -32, y: 0)
                        .frame(width: 290.0, height: 250.0)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 110.0)
                        .lineLimit(10, reservesSpace: true)
                    TextField("Enter extra info...", text: $information, axis: .vertical)
                        .offset(x: -32, y: 380)
                        .frame(width: 290.0, height: 250.0)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 110.0)
                        .lineLimit(10, reservesSpace: true)
                    
             
                    
                    Text("Submit")
                        .font(.system(size: 29))
                        .foregroundColor(.white)
                        .offset(x: 0, y: 360)
                NavigationLink(destination: ThankYou()) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 180, height: 50)
                        .foregroundColor(Color("DarkGreen"))
                        .offset(x: 0, y: 360)
                }
                }
            }
    }
}

#Preview {
    Survey()
}
