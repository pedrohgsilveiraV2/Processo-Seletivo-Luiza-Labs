//
//  StatusCode.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

enum StatusCode: Int {

    case ok = 200
    case notModified = 304
    case validationFailed = 422
    case serviceUnavailable = 503
    case undefined

    typealias RawValue = Int

    init(rawValue: RawValue) {
        switch rawValue {
        case 200:
            self = .ok
        case 304:
            self = .notModified
        case 422:
            self = .validationFailed
        case 503:
            self = .serviceUnavailable
        default:
            self = .undefined
        }
    }
}
