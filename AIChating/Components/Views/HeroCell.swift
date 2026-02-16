//
//  HeroCell.swift
//  AIChating
//
//  Created by Tirzaan on 2/16/26.
//

import SwiftUI

struct HeroCell: View {
    var title: String? = MockData.shared.mockTitle("Hero Cell")
    var subtitle: String? = MockData.shared.mockSubtitle("Hero Cell")
    var imageName: String? = Constants.image
    
    var body: some View {
        ZStack {
            if let imageName {
                ImageLoaderView(imageName)
            } else {
                Rectangle()
                    .fill(.accent)
            }
        }
        .overlay(alignment: .bottomLeading) {
            VStack(alignment: .leading, spacing: 8) {
                if let title {
                    Text(title)
                        .font(.headline)
                }
                
                if let subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                }
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background {
                LinearGradient(
                    colors: [
                        .black.opacity(0),
                        .black.opacity(0.3)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
        }
        .rounded(16)
    }
}

#Preview {
    ScrollView {
        VStack {
            HeroCell()
                .frame(width: 350, height: 225)
            
            HeroCell(title: nil)
                .frame(width: 350, height: 225)
            
            HeroCell(subtitle: nil)
                .frame(width: 350, height: 225)
            
            HeroCell(imageName: nil)
                .frame(width: 350, height: 225)
            
            HeroCell()
                .frame(width: 350, height: 350)
            
            HeroCell()
                .frame(width: 200, height: 350)
        }
        .frame(maxWidth: .infinity)
    }
}
