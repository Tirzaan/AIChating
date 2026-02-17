//
//  CategoryCell.swift
//  AIChating
//
//  Created by Tirzaan on 2/17/26.
//

import SwiftUI

struct CategoryCell: View {
    var title: String = "Aliens"
    var imageName: String = Constants.image
    var font: Font = .title2
    var cornerRadius: CGFloat = 16
    
    var body: some View {
        ImageLoaderView(imageName)
            .aspectRatio(1, contentMode: .fit)
            .overlay(alignment: .bottomLeading) {
                Text(title)
                    .font(font)
                    .fontWeight(.semibold)
                    .padding(16)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .withBlackGradientBackground()
            }
            .rounded(cornerRadius)
    }
}

#Preview {
    VStack {
        CategoryCell()
            .frame(width: 150)
        
        CategoryCell(title: "Men", font: .body, cornerRadius: 50)
            .frame(width: 300)
    }
}
