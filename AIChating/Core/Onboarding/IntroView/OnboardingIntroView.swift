//
//  OnboardingIntroView.swift
//  AIChating
//
//  Created by Tirzaan on 2/10/26.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            Text("Make your own \(Text("Avatars").foregroundStyle(.accent).fontWeight(.semibold)) and chat with them!\n\nHave \(Text("real conversations").foregroundStyle(.accent).fontWeight(.semibold)) with AI generated responses!")
                .baselineOffset(6)
                .frame(maxHeight: .infinity)
                .padding(24)
            
            NavigationLink {
                OnboardingColorView()
            } label: {
                Text("Continue")
                    .callToActionButton()
            }
        }
        .padding(24)
        .font(.title2)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        OnboardingIntroView()
    }
}
