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
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messageManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .onChange(of: messageManager.lastMessageId) { id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            
            MessageField()
                .environmentObject(messageManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
