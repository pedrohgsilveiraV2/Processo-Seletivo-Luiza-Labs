//
//  DummyNetworkError.swift
//  CoreTests
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

@testable import Core

enum DummyNetworkError {
    case purposefulError
}

extension DummyNetworkError: RequestError {

    var description: String {
        switch self {
        case .purposefulError:
            return String(describing: self)
        }
    }

    var errorDescription: String? { description }
}
