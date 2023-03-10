//
//  ContentView.swift
//  ChitChat
//
//  Created by Sayor Debbarma on 10/03/23.
//

import SwiftUI

struct ContentView: View {
    var tempMessage = ["Sleep early dude, rip health 🙏", "I tried… but how to sleep if I don’t feel sleepy bruh🥲", "Just sleep lol", "GoodNight"]
    
    var body: some View {
        VStack {
            VStack {
                TitlteRow()
                
                ScrollView() {
                    ForEach(tempMessage, id: \.self) { text in
                        MessageBubble(message: Message(id: "123", text: text, received: false, timestamp: Date()))
                    }
                }
                .padding(.top, 10)
            }
            
            MessageField()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
