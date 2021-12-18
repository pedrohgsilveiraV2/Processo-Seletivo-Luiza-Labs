//
//  NetworkRequestable.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

public protocol NetworkRequestable {

    func request<T: Decodable>(requestBuilder: URLRequestBuilder,
                               responseType: T.Type,
                               completion: @escaping (Result<T?, NetworkError>) -> Void)
}
