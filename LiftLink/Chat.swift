//
//  Chat.swift
//  LiftLink
//
//  Created by Tiffany Lin on 4/4/24.
//

import SwiftUI

struct Chat: View {
    @StateObject var messagesManager = MessagesManager()
       
       var body: some View {
           VStack {
               VStack {
                   TitleRow()
                   
                   ScrollViewReader { proxy in
                       ScrollView {
                           ForEach(messagesManager.messages, id: \.id) { message in
                               MessageBubble(message: message)
                           }
                       }
                       .padding(.top, 10)
                       .background(.white)
                       .cornerRadius(30)
                       .onChange(of: messagesManager.lastMessageId) { id in
                           // When the lastMessageId changes, scroll to the bottom of the conversation
                           withAnimation {
                               proxy.scrollTo(id, anchor: .bottom)
                           }
                       }
                   }
               }
               .background(Color("Green"))
               
               MessageField()
                   .environmentObject(messagesManager)
           }
       }
   }
    struct ContentView_Previews: PreviewProvider{
        static var previews: some View{
            Chat()
        }
    }

