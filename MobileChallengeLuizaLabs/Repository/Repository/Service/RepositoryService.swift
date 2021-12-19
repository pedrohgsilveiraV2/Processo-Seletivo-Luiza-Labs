//
//  RepositoryService.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

struct RepositoryService: RepositoryServiceProtocol {

    private let client: NetworkRequestable

    init(client: NetworkRequestable = NetworkClient()) {
        self.client = client
    }

    func fetchRepositories(currentPage: Int, _ completion: @escaping (Result<RepositoyListResponse, NetworkError>) -> Void) {
        let requestBuilder = URLRequestBuilder(from: RepositoryRequest.fetchRepositories(currentPage: currentPage))

        client.request(requestBuilder: requestBuilder, responseType: RepositoyListResponse.self, completion: completion)
    }
}
