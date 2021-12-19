//
//  EndlessScrollTableViewCellViewModel.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 18/12/21.
//

import UIKit

public protocol EndlessScrollTableViewCellViewModel: Hashable {
    var repositoryName: String { get }
    var repositoryDescription: String { get }
    var forkScore: Int { get }
    var starScore: Int { get }
    var userName: String { get }
    var profileImage: UIImage { get }
}
