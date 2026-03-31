//
//  ChatRowCell.swift
//  AIChating
//
//  Created by Tirzaan on 3/25/26.
//

import SwiftUI

struct ChatRowCell: View {
    var imageName: String? = Constants.image
    var headline: String? = "Alpha"
    var subHeadline: String? = "This is the last message in the chat. With more text"
    var hasNewMessage: Bool = false
    var padding: CGFloat = 0
    
    var body: some View {
        HStack(spacing: 8) {
            Group {
                if let imageName {
                    ImageLoaderView(imageName)
                } else {
                    Rectangle()
                        .fill(.secondary.opacity(0.5))
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                if let headline {
                    Text(headline)
                        .font(.headline)
                }
                
                if let subHeadline {
                    Text(subHeadline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if hasNewMessage {
                Text("NEW")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(.blue)
                    .rounded(8)
            }
        }
        .padding(padding)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    ZStack {
        List {
            ChatRowCell()
            ChatRowCell(padding: 16)
                .removeListFormatting()
            ChatRowCell(hasNewMessage: true)
            ChatRowCell(imageName: nil)
            ChatRowCell(headline: nil)
            ChatRowCell(subHeadline: nil)
        }
    }
}
