//
//  AppView.swift
//  AIChating
//
//  Created by Tirzaan on 2/4/26.
//

import SwiftUI

struct AppView: View {
    @State var appState = AppState()
    
    var body: some View {
        AppViewBuilder(
            showTabbar: appState.showTabbar,
            tabbarView: {
                TabbarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview("Tabbar") {
    AppView(appState: AppState(showTabbar: true))
}

#Preview("Onboarding") {
    AppView(appState: AppState(showTabbar: false))
}
