//
//  MainCoordinator.swift
//  MobileChallengeLuizaLabs
//
//  Created by pedro.silveira on 19/12/21.
//

import Core
import UIKit
import Repository

final class MainCoordinator: Coordinator {

    let rootViewController: UINavigationController

    public init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController

        super.init()
    }

    public override func start(_ completion: (() -> Void)?) {
        let repositoryCoordinator = RepositoryCoordinator(rootViewController: rootViewController)

        repositoryCoordinator.start(nil)
    }
}
