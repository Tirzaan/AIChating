//
//  ProfileView.swift
//  AIChating
//
//  Created by Tirzaan on 2/7/26.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettingsView: Bool = false
    @State private var showCreateAvatarView: Bool = false
    @State private var currentUser: UserModel? = .mock
    @State private var myAvatars: [AvatarModel] = []
    @State private var isLoading: Bool = true
    
    var body: some View {
        NavigationStack {
            List {
                myProfilePicture
                myAvatarsList
            }
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton
                    }
                }
                .sheet(isPresented: $showSettingsView) {
                    SettingsView()
                }
                .fullScreenCover(isPresented: $showCreateAvatarView) {
                    Text("Avatar")
                }
                .task {
                    await loadData()
                }
        }
    }
    
    private var myProfilePicture: some View {
        Section {
            ZStack {
                Circle()
                    .fill(currentUser?.profileColor ?? .accent)
            }
            .frame(width: 100, height:  100)
            .frame(maxWidth: .infinity)
            .removeListFormatting()
        }
    }
    
    private var myAvatarsList: some View {
        Section {
            if myAvatars.isEmpty {
                Group {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Click + to create an avatar")
                    }
                }
                .padding(50)
                .frame(maxWidth: .infinity)
                .font(.body)
                .foregroundStyle(.secondary)
                .removeListFormatting()
            } else {
                ForEach(myAvatars, id: \.self) { avatar in
                    ListCell(
                        title: avatar.name,
                        subtitle: nil,
                        imageName: avatar.profileImageName,
                        inList: true
                    )
                    .asButton(.highlight) {
                        
                    }
                }
                .onDelete { indexSet in
                    deleteAvatar(indexSet: indexSet)
                }
            }
        } header: {
            HStack(spacing: 0) {
                Text("My Avatars".uppercased())
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundStyle(.accent)
                    .asButton {
                        showCreateNewAvatarView()
                    }
            }
        }
    }
    
    private var settingsButton: some View {
        Image(systemName: "gear")
            .font(.headline)
            .foregroundStyle(isIOS26 ? Color.primary : Color.accent)
            .asButton(.tap) {
                toggleShowSettingsView()
            }
    }

    private var isIOS26: Bool {
        if #available(iOS 26, *) { true } else { false }
    }
    
    private func toggleShowSettingsView() {
        showSettingsView.toggle()
    }
    
    private func showCreateNewAvatarView() {
        showCreateAvatarView = true
    }
    
    private func deleteAvatar(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        myAvatars.remove(at: index)
    }
    
    private func loadData() async {
        try? await Task.sleep(for: .seconds(4))
        isLoading = false
        myAvatars = AvatarModel.mocks
    }
}

#Preview {
    NavigationStack {
        ProfileView()
            .environment(AppState())
    }
}
