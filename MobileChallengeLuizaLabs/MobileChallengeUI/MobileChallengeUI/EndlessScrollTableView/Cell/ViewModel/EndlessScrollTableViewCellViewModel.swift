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
}
