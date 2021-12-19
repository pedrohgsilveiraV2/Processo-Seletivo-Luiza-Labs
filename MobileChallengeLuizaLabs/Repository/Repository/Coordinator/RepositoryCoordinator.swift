//
//  RepositoryCoordinator.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core
import UIKit

public final class RepositoryCoordinator: Coordinator {

    // MARK: - Properties
    let rootViewController: UINavigationController

    // MARK: - Life Cycle
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

    // MARK: - Accessory Methods
    private func goToPullRequestList(with credentials: PullRequestCredentials) {
        let pullRequestListViewController = PullRequestListViewController(credentials: credentials)

        pullRequestListViewController.coordinator = self

        rootViewController.pushViewController(pullRequestListViewController, animated: true)
    }

    private func showToPullRequestPage(with url: URL) {
        let pullRequestPageViewController = PullRequestPageViewController(pullRequestUrl: url)

        rootViewController.modalPresentationStyle = .pageSheet
        rootViewController.modalTransitionStyle = .crossDissolve

        rootViewController.present(pullRequestPageViewController, animated: true, completion: nil)
    }
}

// MARK: - Repository Coordinator Events Handler
private extension RepositoryCoordinator {
    func handle(_ event: RepositoryCoordinatorEvents) {
        switch event {
        case .goToPullRequestList(let credentials):
            goToPullRequestList(with: credentials)
        case .showToPullRequestPage(let url):
            showToPullRequestPage(with: url)
        }
    }
}
