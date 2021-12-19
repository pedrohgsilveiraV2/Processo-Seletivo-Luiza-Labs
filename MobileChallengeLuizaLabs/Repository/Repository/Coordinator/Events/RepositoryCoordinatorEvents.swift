//
//  RepositoryCoordinatorEvents.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

enum RepositoryCoordinatorEvents: CoordinatorEvent {
    case goToPullRequestListViewController(with: PullRequestCredentials)
}
