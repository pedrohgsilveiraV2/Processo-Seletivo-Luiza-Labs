//
//  NetworkServiceStub.swift
//  CoreTests
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

@testable import Core

final class NetworkServiceStub: NetworkService {

    let bundle: Bundle
    var json: URL?

    var shouldFail: Bool = false
    var statusCode: StatusCode = .ok

    init(bundle: Bundle) {
        self.bundle = bundle
    }

    func request(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {

        if shouldFail {
            completionHandler(nil, nil, DummyNetworkError.purposefulError)
        }

        guard let urlPath = url.url else {
            completionHandler(nil, nil, nil)
            return
        }

        let urlResponse = HTTPURLResponse(url: urlPath, statusCode: statusCode.rawValue, httpVersion: nil, headerFields: nil)

        switch statusCode {
        case .ok:

            guard let jsonUrl = json, let data = try? Data(contentsOf: jsonUrl) else {
                completionHandler(nil, urlResponse, nil)
                return
            }

            completionHandler(data, urlResponse, nil)
        case .notModified:
            let notModifiedString = "Not Modified"
            let data = Data(notModifiedString.utf8)

            completionHandler(data, urlResponse, nil)

        case .serviceUnavailable:
            let serviceUnavailableString = "Service Unavailable"
            let data = Data(serviceUnavailableString.utf8)

            completionHandler(data, urlResponse, nil)
        case .validationFailed:
            let validationFailedString = "Unprocessable Entity"
            let data = Data(validationFailedString.utf8)

            completionHandler(data, urlResponse, nil)
        case .undefined:
            let undefinedErrorString = "undefined"
            let data = Data(undefinedErrorString.utf8)

            completionHandler(data, urlResponse, nil)
        }
    }
}
