//
//  RepositoryRequest.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

enum RepositoryRequest: HTTPRequest {
    case fetchRepositories(currentPage: Int)
}

extension RepositoryRequest {

    private enum Constants {
        static var baseURL: String = "https://api.github.com"
    }

    var urlComponents: URLComponents {
        switch self {
        case .fetchRepositories:
            guard let components = URLComponents(string: Constants.baseURL) else {
                return URLComponents()
            }
            return components
        }
    }

    var method: HTTPMethod {
        switch self {
        case .fetchRepositories:
            return .get
        }
    }

    var headers: [String : String]? {
        switch self {
        case .fetchRepositories:
            return nil
        }
    }

    var body: HTTPBody? {
        switch self {
        case .fetchRepositories:
            return nil
        }
    }

    var queryParameters: [String : String]? {
        switch self {
        case .fetchRepositories(let currentPage):
            return ["q": "language: Swift", "sort": "stars", "page": "\(currentPage)"]
        }
    }

    var path: [String]? {
        switch self {
        case .fetchRepositories:
            return ["/search", "repositories"]
        }
    }

}
