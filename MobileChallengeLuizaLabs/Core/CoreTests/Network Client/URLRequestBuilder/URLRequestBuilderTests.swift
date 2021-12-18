//
//  URLRequestBuilderTests.swift
//  CoreTests
//
//  Created by pedro.silveira on 18/12/21.
//

import Quick
import Nimble

@testable import Core

final class URLRequestBuilderTests: QuickSpec {

    override func spec() {

        describe("URLRequestBuilder") {

            var sut: URLRequestBuilder!

            context("When createRequest is called") {

                var request: NSMutableURLRequest?

                beforeEach {
                    let requestDummy = HTTPRequestDummy()

                    sut = URLRequestBuilder(from: requestDummy)

                    request = sut.createRequest()
                }

                it("Should have created an request") {
                    expect(request).toNot(beNil())
                }
            }
        }
    }
}
