//
//  OnboardingCompletedView.swift
//  AIChating
//
//  Created by Tirzaan on 2/7/26.
//

import SwiftUI

struct OnboardingCompletedView: View {
    @Environment(AppState.self) private var root
    var selectedColor: Color = .orange
    @State private var isCompletingProfileSetup: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Setup Complete!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
            
            Text("We've set up your profile and you are ready to start chating.")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            finishButton
        }
        .padding(16)
    }
    
    private var finishButton: some View {
        Button {
            onFinishButtonPressed()
        } label: {
            ZStack {
                if isCompletingProfileSetup {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Finish")
                }
            }
            .callToActionButton()
        }
        .disabled(isCompletingProfileSetup)
    }
    
    func onFinishButtonPressed() {
        Task {
            isCompletingProfileSetup = true
            try await Task.sleep(for: .seconds(3))
//            try await saveUserProfile(color: selectedColor)
            isCompletingProfileSetup = false
            
            root.updateViewState(showTabbarView: true)
        }
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
