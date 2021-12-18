//
//  HTTPMethodTests.swift
//  CoreTests
//
//  Created by pedro.silveira on 18/12/21.
//

import Quick
import Nimble

@testable import Core

final class HTTPMethodTests: QuickSpec {

    override func spec() {

        describe("HTTPMethod") {

            var sut: HTTPMethod!

            context("When initialized with get") {

                beforeEach {
                    sut = HTTPMethod.get
                }

                it("Should have correct raw value") {
                    expect(sut.rawValue).to(equal("GET"))
                }
            }

            context("When initialized with post") {

                beforeEach {
                    sut = HTTPMethod.post
                }

                it("Should have correct raw value") {
                    expect(sut.rawValue).to(equal("POST"))
                }
            }

            context("When initialized with put") {

                beforeEach {
                    sut = HTTPMethod.put
                }

                it("Should have correct raw value") {
                    expect(sut.rawValue).to(equal("PUT"))
                }
            }
        }
    }
}
