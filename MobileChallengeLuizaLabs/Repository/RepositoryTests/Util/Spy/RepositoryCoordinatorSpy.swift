//
//  RepositoryCoordinatorSpy.swift
//  RepositoryTests
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

@testable import Repository

final class RepositoryCoordinatorSpy: CoordinatorProtocol {
    var parentCoordinator: CoordinatorProtocol?

    func start(_ completion: (() -> Void)?) { }

    private(set) var receivedEvent: RepositoryCoordinatorEvents?

    func handle(_ event: CoordinatorEvent) {
        guard let repositoryCoordinatorEvents = event as? RepositoryCoordinatorEvents else { return }

        receivedEvent = repositoryCoordinatorEvents
    }
}
