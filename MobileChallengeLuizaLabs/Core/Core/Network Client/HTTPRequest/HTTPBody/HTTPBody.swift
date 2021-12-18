//
//  HTTPBody.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

protocol HTTPBody {
    func getData() throws -> Data
}
