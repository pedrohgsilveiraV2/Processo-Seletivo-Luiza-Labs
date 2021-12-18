//
//  RequestError.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

protocol RequestError: LocalizedError {
    var description: String { get }
}
