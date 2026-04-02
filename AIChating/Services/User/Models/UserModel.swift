//
//  UserModel.swift
//  AIChating
//
//  Created by Tirzaan on 3/31/26.
//
import Foundation
import SwiftUI

struct UserModel {
    let userId: String
    let dateCreated: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?
    
    init(userId: String, dateCreated: Date? = nil, didCompleteOnboarding: Bool? = nil, profileColorHex: String? = nil) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
    }
    
    var profileColor: Color {
        if let profileColorHex {
            return Color(hex: profileColorHex)
        }
        return .accent
    }
    
    static var mock: UserModel {
        mocks[0]
    }
    
    static var mocks: [UserModel] {
        let now = Date()
        return [
            UserModel(
                userId: "user_001",
                dateCreated: now.addingTimeInterval(days: -30),
                didCompleteOnboarding: true,
                profileColorHex: "#33A1FF"
            ),
            UserModel(
                userId: "user_002",
                dateCreated: now.addingTimeInterval(days: -7),
                didCompleteOnboarding: true,
                profileColorHex: "#FF5733"
            ),
            UserModel(
                userId: "user_003",
                dateCreated: now.addingTimeInterval(days: -1),
                didCompleteOnboarding: false,
                profileColorHex: "#85FF33"
            ),
            UserModel(
                userId: "user_004",
                dateCreated: now.addingTimeInterval(hours: -2),
                didCompleteOnboarding: nil,
                profileColorHex: nil
            )
        ]
    }
}
