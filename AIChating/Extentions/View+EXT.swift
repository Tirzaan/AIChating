//
//  View+EXT.swift
//  AIChating
//
//  Created by Tirzaan on 2/7/26.
//

import SwiftUI

extension View {
    func rounded(_ cornerRadius: CGFloat) -> some View {
        self
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
    
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent)
            .rounded(16)
    }
    
    func tappableBackground() -> some View {
        background(.black.opacity(0.001))
    }
    
    func removeListFormatting() -> some View {
        self
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowBackground(EmptyView())
    }
    
    func withBlackGradientBackground() -> some View {
        background(
            LinearGradient(
                colors: [
                    .black.opacity(0),
                    .black.opacity(0.3)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}
