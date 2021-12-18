//
//  NetworkService.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

public protocol NetworkService {
    func request(with url: URLRequest, completionHandler: @escaping (Data?,
                                                                     URLResponse?,
                                                                     Error?) -> Void)
}
