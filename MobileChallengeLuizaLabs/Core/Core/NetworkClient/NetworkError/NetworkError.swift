//
//  NetworkError.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

public struct NetworkError: RequestError {

    var statusCode: StatusCode
    var type: NetworkErrorType

    var description: String {
        type.description
    }

    public var errorDescription: String? { description }

    init(statusCode: Int, type: NetworkErrorType) {
        self.statusCode = StatusCode(rawValue: statusCode)
        self.type = type
    }

    init(statusCode: Int) {
        self.statusCode = StatusCode(rawValue: statusCode)
        self.type = NetworkErrorType(rawValue: StatusCode(rawValue: statusCode))
    }
}

enum NetworkErrorType {

    case badURL
    case notModified
    case validationFailed
    case serviceUnavailable
    case failedToDecode
    case undefined

    typealias RawValue = StatusCode

    init(rawValue: RawValue) {
        switch rawValue {
        case .notModified:
            self = .notModified
        case .validationFailed:
            self = .validationFailed
        case .serviceUnavailable:
            self = .serviceUnavailable
        default:
            self = .undefined
        }
    }
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
        case .failedToDecode:
            return ""
        case .undefined:
            return L10n.undefinedDescription
        }
    }
}
