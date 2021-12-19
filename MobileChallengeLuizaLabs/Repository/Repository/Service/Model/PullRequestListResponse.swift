//
//  PullRequestListResponse.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

struct PullRequestOwner: Codable {
    var ownerName: String

    var ownerProfileAvatarPath: String

    enum CodingKeys: String, CodingKey {
        case ownerName = "login"
        case ownerProfileAvatarPath = "avatar_url"
    }
}

struct PullRequestItemResponse: Codable {

    var pullRequestPath: String

    var title: String

    var owner: PullRequestOwner

    var description: String

    enum CodingKeys: String, CodingKey {
        case pullRequestPath = "html_url"
        case title = "title"
        case owner = "user"
        case description = "body"
    }
}
