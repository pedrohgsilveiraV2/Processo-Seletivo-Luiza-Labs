//
//  PullRequestListProviderStub.swift
//  RepositoryTests
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

@testable import Repository

struct PullRequestListProviderStub: PullRequestListProviderProtocol {

    var fetchPullRequestResult: Result<[PullRequestItemResponse], NetworkError>?

    init(fetchPullRequestResult: Result<[PullRequestItemResponse], NetworkError>? = nil) {
        self.fetchPullRequestResult = fetchPullRequestResult
    }

    func fetchPullRequest(credentials: PullRequestCredentials, _ completion: @escaping (Result<[PullRequestItemResponse], NetworkError>) -> Void) {
        completion(fetchPullRequestResult!)
    }
}
