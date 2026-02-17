//
//  ExploreView.swift
//  AIChating
//
//  Created by Tirzaan on 2/7/26.
//

import SwiftUI

struct ExploreView: View {
    @State private var featuredAvatars = AvatarModel.mocks
    @State private var categories: [CharacterOption] = CharacterOption.allCases

    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categorySection
            }
            .navigationTitle("Explore")
        }
    }
    
    private var featuredSection: some View {
        Section("Featured Avatars") {
            CarouselCell(items: featuredAvatars) { avatar in
                HeroCell(
                    title: avatar.name,
                    subtitle: avatar.description,
                    imageName: avatar.profileImageName
                )
            }
            .removeListFormatting()
        }
    }
    
    private var categorySection: some View {
        Section("Categories") {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(categories, id: \.self) { category in
                        CategoryCell(
                            title: category.rawValue.capitalized,
                            imageName: Constants.image
                        )
                    }
                }
            }
            .frame(height: 140)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .removeListFormatting()
        }
    }
}

#Preview {
    ExploreView()
}
