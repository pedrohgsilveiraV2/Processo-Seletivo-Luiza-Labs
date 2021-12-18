//
//  URLSessionService.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

public struct URLSessionService: NetworkService {
    public func request(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let service = URLSession.shared
        let task = service.dataTask(with: url, completionHandler: completionHandler)
        
        task.resume()
    }

    public init() {}
}
