//
//  NetworkErrorTests.swift
//  CoreTests
//
//  Created by pedro.silveira on 18/12/21.
//

import Quick
import Nimble

@testable import Core

final class NetworkErrorTests: QuickSpec {

    override func spec() {

        describe("NetworkError") {

            var sut: NetworkError!

            context("When initialized with bad URL") {

                beforeEach {
                    sut = NetworkError(statusCode: 0, type: .badURL)
                }

                it("Should have correct status code and description") {
                    expect(sut.errorDescription).to(equal("Could not use URL as Response"))
                    expect(sut.statusCode).to(equal(.undefined))
                }
            }

            context("When initialized with not modified") {

                beforeEach {
                    sut = NetworkError(statusCode: 304, type: .notModified)
                }

                it("Should have correct status code and description") {
                    expect(sut.errorDescription).to(equal("Not Modified"))
                    expect(sut.statusCode).to(equal(.notModified))
                }
            }

            context("When initialized with validation failed") {

                beforeEach {
                    sut = NetworkError(statusCode: 422, type: .validationFailed)
                }

                it("Should have correct status code and description") {
                    expect(sut.errorDescription).to(equal("Unprocessable Entity"))
                    expect(sut.statusCode).to(equal(.validationFailed))
                }
            }

            context("When initialized with Service Unavailable") {

                beforeEach {
                    sut = NetworkError(statusCode: 503, type: .serviceUnavailable)
                }

                it("Should have correct status code and description") {
                    expect(sut.errorDescription).to(equal("Service Unavailable"))
                    expect(sut.statusCode).to(equal(.serviceUnavailable))
                }
            }

            context("When initialized with undefined error") {

                beforeEach {
                    sut = NetworkError(statusCode: 0, type: .undefined)
                }

                it("Should have correct status code and description") {
                    expect(sut.errorDescription).to(equal("undefined error"))
                    expect(sut.statusCode).to(equal(.undefined))
                }
            }
        }
    }
}
