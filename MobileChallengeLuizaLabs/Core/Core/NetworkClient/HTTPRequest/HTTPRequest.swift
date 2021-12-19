//
//  HTTPRequest.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

public protocol HTTPRequest {
    var urlComponents: URLComponents { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: HTTPBody? { get }
    var queryParameters: [String: String]? { get }
    var path: [String]? { get }
}
