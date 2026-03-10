//
//  View+EXT.swift
//  AIChating
//
//  Created by Tirzaan on 2/7/26.
//

import SwiftUI

// MARK: View EXTENTIONS
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
    
    func maxHeight(_ alignment: Alignment) -> some View {
        frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func maxWidth(_ alignment: Alignment) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }
    
    private func tapableButton(action: @escaping () -> Void) -> some View {
        onTapGesture {
            action()
        }
    }
    
    private func plainButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func highlightButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(HighlightButtonStyle())
    }
    
    private func pressableButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PressableButtonStyle())
    }
    
    @ViewBuilder
    func asButton(_ option: ButtonStyleOption = .plain, action: @escaping () -> Void) -> some View {
        switch option {
        case .press:
            self.pressableButton(action: action)
        case .highlight:
            self.highlightButton(action: action)
        case .plain:
            self.plainButton(action: action)
        case .tap:
            self.tapableButton(action: action)
        }
    }
}

enum ButtonStyleOption {
    case highlight
    case press
    case plain
    case tap
}

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.smooth(duration: 0.25), value: configuration.isPressed)
    }
}

struct HighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay {
                configuration.isPressed ? Color.accent.opacity(0.4) : Color.accent.opacity(0)
            }
            .animation(.smooth, value: configuration.isPressed)
    }
}

#Preview {
    VStack {
        Text("Highlight")
            .padding()
            .frame(maxWidth: .infinity)
            .tappableBackground()
            .asButton(.highlight) {
                
            }
            .padding(.horizontal)
        
        Text("Press")
            .callToActionButton()
            .asButton(.press) {
                
            }
            .padding()
        
        Text("Plain")
            .callToActionButton()
            .asButton {
                
            }
            .padding(.horizontal)
    }
}
