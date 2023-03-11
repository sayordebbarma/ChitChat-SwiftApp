//
//  MessagesManager.swift
//  ChitChat
//
//  Created by Sayor Debbarma on 11/03/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("error fetching the document: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { documents -> Message? in
                do {
                    return try documents.data(as: Message.self)
                    
                } catch {
                    print("error decoding document into message: \(error)")
                    return nil
                }
            }
            
            self.messages.sort { $0.timestamp < $1.timestamp } // to sort message with repect to their timestamp
        }
    }
    
    func sendMessage(text: String) {
        do {
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            
            try db.collection("messages").document().setData(from: newMessage)
            
        } catch {
            print("Error adding messages into firebase: \(error)")
        }
    }
}

