//
//  ChatRowCellViewBuilder.swift
//  AIChating
//
//  Created by Tirzaan on 3/25/26.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    var userId: String? = ""
    var chat: ChatModel = .mock
    var getAvatar: () async -> AvatarModel?
    var getLastChatMessage: () async -> ChatMessageModel?
    
    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?
    
    @State private var didLoadAvatar: Bool = false
    @State private var didLoadLastChatMessage: Bool = false
    private var isLoading: Bool {
        !(didLoadAvatar && didLoadLastChatMessage)
        /*
         if didLoadAvatar && didLoadLastChatMessage {
             return false
         }
         
         return true
         */
    }
    
    private var subHeadline: String? {
        if isLoading {
            return "xxxxx xxxxx xxxxx xxxxx"
        }
        if avatar == nil && lastChatMessage == nil {
            return "Error Loading Chat."
        }
        
        return lastChatMessage?.content
    }
    
    var body: some View {
        ChatRowCell(
            imageName: avatar?.profileImageName,
            headline: isLoading ? "xxxxx xxxxx" : avatar?.name,
            subHeadline: subHeadline,
            hasNewMessage: isLoading ? false : hasNewChat,
            padding: 16
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task {
            lastChatMessage = await getLastChatMessage()
            didLoadLastChatMessage = true
        }
    }
    
    private var hasNewChat: Bool {
        guard let lastChatMessage else { return false }
        guard let userId else { return false }
        
        return lastChatMessage.hasBeenSeenBy(userId: userId)
    }
}

#Preview {
    VStack {
        ChatRowCellViewBuilder(chat: .mock) {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        } getLastChatMessage: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        }
        
        ChatRowCellViewBuilder(chat: .mock) {
            .mocks.randomElement()
        } getLastChatMessage: {
            .mocks.randomElement()
        }
        
        ChatRowCellViewBuilder(chat: .mock) {
            nil
        } getLastChatMessage: {
            nil
        }
    }
}
