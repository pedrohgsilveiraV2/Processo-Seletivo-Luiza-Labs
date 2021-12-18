//
//  HTTPMethod.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

struct HTTPMethod: Hashable {

    static let get = HTTPMethod(rawValue: "GET")
    static let post = HTTPMethod(rawValue: "POST")
    static let put = HTTPMethod(rawValue: "PUT")

    let rawValue: String
}
