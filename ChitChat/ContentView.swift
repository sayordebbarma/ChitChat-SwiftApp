//
//  ContentView.swift
//  ChitChat
//
//  Created by Sayor Debbarma on 10/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messageManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack {
                TitlteRow()
                
                ScrollView() {
                    ForEach(messageManager.messages, id: \.id) { message in
                        MessageBubble(message: message)
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
