//
//  ExploreView.swift
//  AIChating
//
//  Created by Tirzaan on 2/7/26.
//

import SwiftUI

struct ExploreView: View {
    let avatar = AvatarModel.mock

    var body: some View {
        NavigationStack {
            HeroCell(
                title: avatar.name,
                subtitle: avatar.description,
                imageName: avatar.profileImageName
            )
            .frame(height: 250)
                .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
