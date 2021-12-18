//
//  JSONBody.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

struct JSONBody: HTTPBody {

    private let encoder: () throws -> Data

    init<T: Encodable>(_ value: T, encoder: JSONEncoder = JSONEncoder()) {
        self.encoder = { try encoder.encode(value) }
    }

    func getData() throws -> Data {
        try encoder()
    }
}
