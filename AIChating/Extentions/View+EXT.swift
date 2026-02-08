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
}
