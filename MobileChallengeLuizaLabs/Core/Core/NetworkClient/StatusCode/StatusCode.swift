//
//  StatusCode.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

enum StatusCode: Int {

    case ok
    case notModified
    case validationFailed
    case serviceUnavailable
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
