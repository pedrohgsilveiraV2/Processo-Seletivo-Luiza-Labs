//
//  CodableJSONBodyDummy.swift
//  CoreTests
//
//  Created by pedro.silveira on 18/12/21.
//

import Foundation

struct CodableJSONBodyDummy: Codable {
    var dummyString: String
    var dummyInt: Int
}

extension CodableJSONBodyDummy: Equatable {
    
}
