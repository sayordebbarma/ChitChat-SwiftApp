//
//  Message.swift
//  ChitChat
//
//  Created by Sayor Debbarma on 10/03/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
