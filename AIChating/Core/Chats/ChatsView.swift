//
//  ChatsView.swift
//  AIChating
//
//  Created by Tirzaan on 2/7/26.
//

import SwiftUI

struct ChatsView: View {
    @State private var chats = ChatModel.mocks
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        userId: nil, // FIXME: Add CUID
                        chat: chat,
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        },
                        getLastChatMessage: {
                            return .mock
                        })
                    .asButton(.highlight) {
                        
                    }
                    .removeListFormatting()
                }
            }
            .navigationTitle("Chats")
        }
    }
}

#Preview {
    ChatsView()
}
