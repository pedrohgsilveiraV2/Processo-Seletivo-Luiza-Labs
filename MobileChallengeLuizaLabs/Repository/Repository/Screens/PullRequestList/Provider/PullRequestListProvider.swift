//
//  PullRequestListProvider.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

struct PullRequestListProvider: PullRequestListProviderProtocol {

    private let service: RepositoryServiceProtocol

    init(service: RepositoryServiceProtocol = RepositoryService()) {
        self.service = service
    }

    func fetchPullRequest(credentials: PullRequestCredentials, _ completion: @escaping (Result<[PullRequestItemResponse], NetworkError>) -> Void) {
        service.fetchPullRequest(credentials: credentials, completion)
    }
}
