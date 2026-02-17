//
//  AvatarModel.swift
//  AIChating
//
//  Created by Tirzaan on 2/16/26.
//

import Foundation

struct AvatarModel: Hashable {
    let avatarId: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?
    
    init(
        avatarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarId = avatarId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }
    
    var description: String {
        AvatarDesriptionBuilder(avatar: self).description
    }
    
    static var mock: AvatarModel {
        mocks.first ?? AvatarModel(
            avatarId: UUID().uuidString,
            name: "Alpha",
            characterOption: .alien,
            characterAction: .smiling,
            characterLocation: .park,
            profileImageName: Constants.image,
            authorId: UUID().uuidString,
            dateCreated: .now
        )
    }
    
    static var mocks: [AvatarModel] = [
        AvatarModel(
            avatarId: UUID().uuidString,
            name: "Alpha",
            characterOption: .alien,
            characterAction: .smiling,
            characterLocation: .park,
            profileImageName: Constants.image,
            authorId: UUID().uuidString,
            dateCreated: .now
        ),
        AvatarModel(
            avatarId: UUID().uuidString,
            name: "Beta",
            characterOption: .dog,
            characterAction: .eating,
            characterLocation: .forest,
            profileImageName: Constants.image,
            authorId: UUID().uuidString,
            dateCreated: .now
        ),
        AvatarModel(
            avatarId: UUID().uuidString,
            name: "Gamma",
            characterOption: .cat,
            characterAction: .drinking,
            characterLocation: .museum,
            profileImageName: Constants.image,
            authorId: UUID().uuidString,
            dateCreated: .now
        ),
        AvatarModel(
            avatarId: UUID().uuidString,
            name: "Delta",
            characterOption: .woman,
            characterAction: .shopping,
            characterLocation: .park,
            profileImageName: Constants.image,
            authorId: UUID().uuidString,
            dateCreated: .now
        )
    ]
}

struct AvatarDesriptionBuilder {
    let characterOption: CharacterOption
    let characterAction: CharacterAction
    let characterLocation: CharacterLocation
    
    init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }
    
    init(avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .default
        self.characterAction = avatar.characterAction ?? .default
        self.characterLocation = avatar.characterLocation ?? .default
    }
    
    var description: String {
        "A \(characterOption.rawValue) that is \(characterAction.rawValue) in the \(characterLocation.rawValue)"
    }
}

enum CharacterOption: String, CaseIterable {
    case man
    case woman
    case alien
    case dog
    case cat
    
    static var `default`: Self {
        .man
    }
}

enum CharacterAction: String {
    case smiling
    case laughing
    case thinking
    case drinking
    case sitting
    case eating
    case walking
    case shopping
    case studying
    case working
    case relaxing
    case crying
    case dancing
    case fighting
    
    static var `default`: Self {
        .smiling
    }
}

enum CharacterLocation: String {
    case park
    case beach
    case city
    case forest
    case mall
    case museum
    case desert
    case space
    
    static var `default`: Self {
        .park
    }
}
