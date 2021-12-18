//
//  NetworkError.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

struct NetworkError: RequestError {

    var statusCode: StatusCode
    var type: NetworkErrorType

    var description: String {
        type.description
    }

    var errorDescription: String? { description }

    init(statusCode: Int, type: NetworkErrorType) {
        self.statusCode = StatusCode(rawValue: statusCode)
        self.type = type
    }
}

enum NetworkErrorType {

    case badURL
    case notModified
    case validationFailed
    case serviceUnavailable
    case undefined
}

extension NetworkErrorType {

    var description: String {
        switch self {
        case .badURL:
            return L10n.badUrlDescription
        case .notModified:
            return L10n.notModifiedDescription
        case .validationFailed:
            return L10n.validationFailedDescription
        case .serviceUnavailable:
            return L10n.serviceUnavailableDescription
        case .undefined:
            return L10n.undefinedDescription
        }
    }
}
