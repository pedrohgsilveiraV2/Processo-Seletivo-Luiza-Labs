//
//  HTTPRequestDummy.swift
//  CoreTests
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

@testable import Core

struct HTTPRequestDummy: HTTPRequest {

    var urlComponents: URLComponents {
        guard let components = URLComponents(string: "www.google.com") else {
            return URLComponents()
        }
        return components
    }

    var method: HTTPMethod {
        .get
    }

    var headers: [String : String]? {
        ["SomeHeaderKey": "SomeHeaderValue"]
    }

    var body: HTTPBody? {
        let body = CodableJSONBodyDummy(dummyString: "123", dummyInt: 12)

        return JSONBody(body)
    }

    var queryParameters: [String : String]? {
        ["SomeQueryKey": "SomeQueryValue"]
    }

    var path: [String]? {
        ["/SomePath"]
    }
}
