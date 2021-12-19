//
//  RepositoryListProviderProtocol.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

protocol RepositoryListProviderProtocol {
    func fetchRepositories(currentPage: Int, _ completion: @escaping (Result<RepositoyListResponse, NetworkError>) -> Void) 
}
