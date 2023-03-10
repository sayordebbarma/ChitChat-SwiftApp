//
//  MessafeBubble.swift
//  ChitChat
//
//  Created by Sayor Debbarma on 10/03/23.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("bluee") : Color("pinkk"))
                    .cornerRadius(15)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 15)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        //.padding(.horizontal, 10)
    }
}

struct MessafeBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "12", text: "But seriously, this week I can't. I also want to watch T-T I'll let you know when I'll be free", received: true, timestamp: Date()))
    }
}
