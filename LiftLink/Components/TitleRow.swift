//
//  TitleRow.swift
//  LiftLink
//
//  Created by Tiffany Lin on 4/5/24.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string:"https://unsplash.com/photos/man-in-blue-crew-neck-shirt-4uj3iZ5m084")
    var name = "John Doe"
    
    var body: some View {
        HStack(spacing: 20){
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 50, height : 50)
                    .cornerRadius(50)
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.title).bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
    
    struct TitleRow_Previews : PreviewProvider {
        static var previews: some View{
            TitleRow()
                .background(Color("Green"))
        }
        
    }
    
}
