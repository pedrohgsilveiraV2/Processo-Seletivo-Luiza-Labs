//
//  HTTPMethod.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

public struct HTTPMethod: Hashable {

    public static let get = HTTPMethod(rawValue: "GET")
    public static let post = HTTPMethod(rawValue: "POST")
    public static let put = HTTPMethod(rawValue: "PUT")

    let rawValue: String
}
