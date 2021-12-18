//
//  JSONBody.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

public struct JSONBody: HTTPBody {

    private let encoder: () throws -> Data

    public init<T: Encodable>(_ value: T, encoder: JSONEncoder = JSONEncoder()) {
        self.encoder = { try encoder.encode(value) }
    }

    public func getData() throws -> Data {
        try encoder()
    }
}
