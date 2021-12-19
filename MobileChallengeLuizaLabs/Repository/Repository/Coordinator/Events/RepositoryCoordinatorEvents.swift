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

extension RepositoryCoordinatorEvents: Equatable {
    static func == (lhs: RepositoryCoordinatorEvents, rhs: RepositoryCoordinatorEvents) -> Bool {
        switch (lhs, rhs) {
        case (.goToPullRequestList, .goToPullRequestList):
            return true
        case (.showToPullRequestPage, .showToPullRequestPage):
            return true
        default:
            return false
        }
    }
}
