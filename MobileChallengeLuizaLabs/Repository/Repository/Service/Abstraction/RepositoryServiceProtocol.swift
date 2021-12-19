//
//  RepositoryServiceProtocol.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

protocol RepositoryServiceProtocol {
    func fetchRepositories(currentPage: Int, _ completion: @escaping (Result<RepositoyListResponse, NetworkError>) -> Void)
    func fetchPullRequest(credentials: PullRequestCredentials, _ completion: @escaping (Result<[PullRequestItemResponse], NetworkError>) -> Void)
}
