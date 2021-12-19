//
//  PullRequestListProviderProtocol.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

protocol PullRequestListProviderProtocol {
    func fetchPullRequest(credentials: PullRequestCredentials, _ completion: @escaping (Result<[PullRequestItemResponse], NetworkError>) -> Void)
}
