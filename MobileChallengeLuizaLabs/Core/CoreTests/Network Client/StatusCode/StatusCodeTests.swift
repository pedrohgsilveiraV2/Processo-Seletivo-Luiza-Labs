//
//  StatusCodeTests.swift
//  CoreTests
//
//  Created by pedro.silveira on 18/12/21.
//

import Quick
import Nimble

@testable import Core

final class StatusCodeTests: QuickSpec {

    override func spec() {

        describe("StatusCode") {

            var sut: StatusCode!

            context("When initialized with 200 as value") {

                beforeEach {
                    sut = StatusCode(rawValue: 200)
                }

                it("Should be correct case") {
                    expect(sut).to(equal(.ok))
                }
            }

            context("When initialized with 304 as value") {

                beforeEach {
                    sut = StatusCode(rawValue: 304)
                }

                it("Should be correct case") {
                    expect(sut).to(equal(.notModified))
                }
            }

            context("When initialized with 422 as value") {

                beforeEach {
                    sut = StatusCode(rawValue: 422)
                }

                it("Should be correct case") {
                    expect(sut).to(equal(.validationFailed))
                }
            }

            context("When initialized with 503 as value") {

                beforeEach {
                    sut = StatusCode(rawValue: 503)
                }

                it("Should be correct case") {
                    expect(sut).to(equal(.serviceUnavailable))
                }
            }

            context("When initialized with a unmapped value") {

                beforeEach {
                    sut = StatusCode(rawValue: 0)
                }

                it("Should be correct case") {
                    expect(sut).to(equal(.undefined))
                }
            }
        }
    }
}
