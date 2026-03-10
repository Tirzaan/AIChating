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
    @State private var popularAvatars = AvatarModel.mocks

    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categorySection
                popularSection
            }
            .navigationTitle("Explore")
        }
    }
    
    private var featuredSection: some View {
        Section("Featured") {
            CarouselCell(items: featuredAvatars) { avatar in
                HeroCell(
                    title: avatar.name,
                    subtitle: avatar.description,
                    imageName: avatar.profileImageName
                )
                .asButton {
                    
                }
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
                        .asButton(.press) {
                            
                        }
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
    
    private var popularSection: some View {
        Section("Popular") {
            ForEach(popularAvatars, id: \.self) { avatar in
                ListCell(
                    title: avatar.name,
                    subtitle: avatar.description,
                    imageName: avatar.profileImageName
                )
                .asButton(.press) {
                    
                }
                .removeListFormatting()
            }
        }
    }
}

#Preview {
    ExploreView()
}
