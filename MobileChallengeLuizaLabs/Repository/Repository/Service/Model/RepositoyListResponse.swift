//
//  RepositoyListResponse.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

struct RepositoyOwner: Codable {
    var ownerName: String

    var ownerProfileAvatarPath: String

    enum CodingKeys: String, CodingKey {
        case ownerName = "login"
        case ownerProfileAvatarPath = "avatar_url"
    }
}

struct RepositoyItemResponse: Codable {

    var name: String

    var owner: RepositoyOwner

    var description: String

    var stargazersCount: Int

    var forksCount: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case owner = "owner"
        case description = "description"
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
    }
}

struct RepositoyListResponse: Codable {
    var items: [RepositoyItemResponse]
}
