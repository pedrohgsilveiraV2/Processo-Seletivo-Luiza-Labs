//
//  URLRequestBuilder.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

public struct URLRequestBuilder {

    private let request: HTTPRequest

    private var httpMethod: HTTPMethod {
        request.method
    }

    private var headers: [String: String]? {
        request.headers
    }

    private var bodyData: Data? {
        try? request.body?.getData()
    }

    private var queryParameters: [String: String]? {
        request.queryParameters
    }

    private func createRequest(url: URL, method: HTTPMethod) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: url)

        request.httpMethod = method.rawValue

        return request
    }

    public func createRequest() -> NSMutableURLRequest? {
        var urlComponents = request.urlComponents

        if let queryParameters = queryParameters {
            urlComponents.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }

        guard let url = urlComponents.url else {
            return nil
        }

        let urlRequest = createRequest(url: url, method: httpMethod)

        if let headers = headers {
            headers.forEach {
                urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
            }
        }

        urlRequest.httpBody = bodyData

        return urlRequest
    }

    public init(from request: HTTPRequest) {
        self.request = request
    }
}
