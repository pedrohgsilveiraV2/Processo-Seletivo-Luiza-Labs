//
//  JSONBodyTests.swift
//  CoreTests
//
//  Created by pedro.silveira on 18/12/21.
//

import Quick
import Nimble

@testable import Core

final class JSONBodyTests: QuickSpec {

    override func spec() {

        describe("JSONBody") {

            var sut: JSONBody!

            context("When initialized with an Encodable object") {

                var codableDummy: CodableJSONBodyDummy!

                beforeEach {
                    codableDummy = CodableJSONBodyDummy(dummyString: "123", dummyInt: 12)

                    sut = JSONBody(codableDummy)
                }

                it("Should have encoded correctly") {
                    let encodedData = try sut.getData()

                    let decodedData = try JSONDecoder().decode(CodableJSONBodyDummy.self, from: encodedData)

                    expect(codableDummy).to(equal(decodedData))
                }
            }
        }
    }
}
