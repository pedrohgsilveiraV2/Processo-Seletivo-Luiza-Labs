//
//  RepositoryListProvider.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

struct RepositoryListProvider: RepositoryListProviderProtocol {

    private let service: RepositoryServiceProtocol

    init(service: RepositoryServiceProtocol = RepositoryService()) {
        self.service = service
    }

    func fetchRepositories(currentPage: Int, _ completion: @escaping (Result<[RepositoyListResponse], NetworkError>) -> Void) {
        service.fetchRepositories(currentPage: currentPage, completion)
    }
}
