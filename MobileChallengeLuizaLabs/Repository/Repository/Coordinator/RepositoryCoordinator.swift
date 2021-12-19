//
//  RepositoryCoordinator.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core
import UIKit

public final class RepositoryCoordinator: Coordinator {

    let rootViewController: UINavigationController

    public init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController

        super.init()

        register(eventType: RepositoryCoordinatorEvents.self) { [weak self] in self?.handle($0) }
    }

    public override func start(_ completion: (() -> Void)?) {
        let repositoryListViewController = RepositoryListViewController()

        repositoryListViewController.coordinator = self

        rootViewController.pushViewController(repositoryListViewController, animated: true)
    }

    private func goToPullRequestListViewController(with credentials: PullRequestCredentials) {
        let pullRequestListViewController = PullRequestListViewController(credentials: credentials)

        pullRequestListViewController.coordinator = self

        rootViewController.pushViewController(pullRequestListViewController, animated: true)
    }
}

private extension RepositoryCoordinator {
    func handle(_ event: RepositoryCoordinatorEvents) {
        switch event {
        case .goToPullRequestListViewController(let credentials):
            goToPullRequestListViewController(with: credentials)
        }
    }
}
