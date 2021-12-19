//
//  EndlessScrollTableViewCellViewModel.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 18/12/21.
//

import UIKit

public struct EndlessScrollTableViewCellViewModel: Hashable {

    public var repositoryName: String

    public var repositoryDescription: String

    public var forkScore: Int

    public var starScore: Int

    public var userName: String

    public var profileImage: UIImage

    public init(repositoryName: String, repositoryDescription: String, forkScore: Int, starScore: Int, userName: String, profileImage: UIImage) {
        self.repositoryName = repositoryName
        self.repositoryDescription = repositoryDescription
        self.forkScore = forkScore
        self.starScore = starScore
        self.userName = userName
        self.profileImage = profileImage
    }
}
