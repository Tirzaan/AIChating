//
//  ChatModel.swift
//  AIChating
//
//  Created by Tirzaan on 3/24/26.
//

import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date
    
    static var mock: ChatModel {
        mocks[0]
    }
    
    static var mocks: [ChatModel] {
        let now = Date()
        return [
            ChatModel(
                id: "mock_chat_1",
                userId: "mock_user_1",
                avatarId: "mock_avatar_1",
                dateCreated: now.addingTimeInterval(days: -10),
                dateModified: now.addingTimeInterval(days: -10, hours: 2)
            ),
            ChatModel(
                id: "mock_chat_2",
                userId: "mock_user_1",
                avatarId: "mock_avatar_2",
                dateCreated: now.addingTimeInterval(days: -7),
                dateModified: now.addingTimeInterval(days: -7, hours: 1, minutes: 30)
            ),
            ChatModel(
                id: "mock_chat_3",
                userId: "mock_user_2",
                avatarId: "mock_avatar_1",
                dateCreated: now.addingTimeInterval(days: -3),
                dateModified: now.addingTimeInterval(days: -3, minutes: 45)
            ),
            ChatModel(
                id: "mock_chat_4",
                userId: "mock_user_3",
                avatarId: "mock_avatar_3",
                dateCreated: now.addingTimeInterval(days: -1),
                dateModified: now.addingTimeInterval(days: -1, hours: 4, minutes: 15)
            )
        ]
    }
}
