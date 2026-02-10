//
//  WelcomeView.swift
//  AIChating
//
//  Created by Tirzaan on 2/7/26.
//

import SwiftUI

struct WelcomeView: View {
    @State var imageName: String = Constants.mockImage
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(imageName)
                    .ignoresSafeArea()
                
                titleSection
                .padding(.top, 24)
                
                loginButtons
                .padding(16)
                
                policyLinks
            }
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("AI Chating 🤙")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("Youtube: @Swiftfulthinking")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
    
    private var loginButtons: some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingCompletedView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }
            
            Text("Already have an account? Sign in!")
                .underline()
                .font(.body)
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    
                }
        }
    }
    
    private var policyLinks: some View {
        HStack(spacing: 8) {
            Link(destination: Constants.termsOfServiceUrl!) {
                Text("Terms of service")
            }
            
            Circle()
                .fill(.accent)
                .frame(width: 5, height: 5)
            
            Link(destination: Constants.privacyPolicyUrl!) {
                Text("Privacy Policy")
            }
        }
    }
}

#Preview {
    WelcomeView()
}
