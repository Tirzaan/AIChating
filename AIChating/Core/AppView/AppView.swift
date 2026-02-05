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
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tab View")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
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
