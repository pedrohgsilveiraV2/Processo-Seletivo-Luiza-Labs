//
//  RepositoryCoordinatorEvents.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

enum RepositoryCoordinatorEvents: CoordinatorEvent {
    case goToPullRequestList(with: PullRequestCredentials)
    case showToPullRequestPage(with: URL)
}
