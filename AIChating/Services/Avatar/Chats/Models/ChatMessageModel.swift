//
//  ChatMessageModel.swift
//  AIChating
//
//  Created by Tirzaan on 3/25/26.
//

import Foundation

struct ChatMessageModel {
    let id: String
    let chatId: String
    let author: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
    init(
        id: String,
        chatId: String,
        author: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.author = author
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    
    static var mock: ChatMessageModel {
        mocks[0]
    }
    
    static var mocks: [ChatMessageModel] {
        let now = Date()
        return [
            ChatMessageModel(
                id: "mock_msg_001",
                chatId: "mock_chat_1",
                author: "user_alice",
                content: "Hey! Are we still on for the meeting tomorrow?",
                seenByIds: ["user_alice", "user_bob", "user_charlie"],
                dateCreated: now.addingTimeInterval(hours: -1)
            ),
            ChatMessageModel(
                id: "mock_msg_002",
                chatId: "mock_chat_3",
                author: "user_bob",
                content: "Yes, 10am works great for me!",
                seenByIds: ["user_alice", "user_bob"],
                dateCreated: now.addingTimeInterval(minutes: -50)
            ),
            ChatMessageModel(
                id: "mock_msg_003",
                chatId: "mock_chat_1",
                author: "user_charlie",
                content: "I'll be a few minutes late, go ahead and start without me.",
                seenByIds: ["user_charlie"],
                dateCreated: now.addingTimeInterval(minutes: -30)
            ),
            ChatMessageModel(
                id: "mock_msg_004",
                chatId: "mock_chat_4",
                author: "user_alice",
                content: nil,
                seenByIds: [],
                dateCreated: now.addingTimeInterval(minutes: -10)
            ),
            ChatMessageModel(
                id: "msg_005",
                chatId: "chat_001",
                author: nil,
                content: "No worries Charlie, see you when you get here!",
                seenByIds: nil,
                dateCreated: now.addingTimeInterval(minutes: -5)
            )
        ]
    }
}
