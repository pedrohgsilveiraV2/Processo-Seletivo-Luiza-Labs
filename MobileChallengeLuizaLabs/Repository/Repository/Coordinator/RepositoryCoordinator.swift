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
    }

    public override func start(_ completion: (() -> Void)?) {
        let repositoryListViewController = RepositoryListViewController()

        rootViewController.pushViewController(repositoryListViewController, animated: true)

        repositoryListViewController.beginAppearanceTransition(true, animated: true)
    }
}
