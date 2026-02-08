//
//  AppView.swift
//  AIChating
//
//  Created by Tirzaan on 2/4/26.
//

import SwiftUI

struct AppView: View {
    @AppStorage("showTabbarView") var showTabbar: Bool = false
    
    var body: some View {
        AppViewBuilder(
            showTabbar: showTabbar,
            tabbarView: {
                TabbarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
    }
}

#Preview("Tabbar") {
    AppView(showTabbar: true)
}

#Preview("Onboarding") {
    AppView(showTabbar: false)
}
