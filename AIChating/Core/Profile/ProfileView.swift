//
//  ProfileView.swift
//  AIChating
//
//  Created by Tirzaan on 2/7/26.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettingsView: Bool = false
    
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton
                    }
                }
                .sheet(isPresented: $showSettingsView) {
                    Text("Settings")
                }
        }
    }
    
    private var settingsButton: some View {
        Image(systemName: "gear")
            .font(.headline)
            .onTapGesture {
                toggleShowSettingsView()
            }
    }
    
    private func toggleShowSettingsView() {
        showSettingsView.toggle()
    }
}

#Preview {
    ProfileView()
}
