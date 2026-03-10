//
//  ListCell.swift
//  AIChating
//
//  Created by Tirzaan on 2/19/26.
//

import SwiftUI

struct ListCell: View {
    var title: String? = MockData.shared.title("List Cell")
    var subtitle: String? = MockData.shared.subtitle("List Cell")
    var imageName: String? = Constants.image
    var inList: Bool = false
    
    var body: some View {
        HStack {
            Group {
                if let imageName {
                    ImageLoaderView(imageName)
                } else {
                    ImageLoaderView()
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .frame(height: 60)
            .rounded(16)
            
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.headline)
                }
                
                if let subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                }
            }
            .maxWidth(.leading)
        }
        .padding(12)
        .padding(.vertical, 4)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        VStack {
            ListCell()
            ListCell(title: nil)
            ListCell(subtitle: nil)
            ListCell(imageName: nil)
        }
        
    }
}
