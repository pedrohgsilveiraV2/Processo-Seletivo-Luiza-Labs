//
//  NetworkClientTests.swift
//  CoreTests
//
//  Created by pedro.silveira on 18/12/21.
//

import Quick
import Nimble

@testable import Core

final class NetworkClientTests: QuickSpec {

    override func spec() {

        describe("NetworkClient") {

            var sut: NetworkClient!
            var service: NetworkServiceStub!

            beforeEach {
                let bundle = Bundle(for: type(of: self))
                service = NetworkServiceStub(bundle: bundle)
                sut = NetworkClient(service: service)
            }

            context("When callign an successful request") {

                beforeEach {
                    service.statusCode = .ok

                    let fakeJSONURL = service.bundle.url(forResource: "DummyResponse", withExtension: "json")

                    service.json = fakeJSONURL
                }

                it("Should return an error") {
                    let requestDummy = HTTPRequestDummy()

                    let requestBuilder = URLRequestBuilder(from: requestDummy)

                    sut.request(requestBuilder: requestBuilder, responseType: CodableJSONBodyDummy.self) { result in
                        guard case .success(let dummy) = result else {
                            fail()
                            return
                        }

                        expect(dummy?.dummyString).to(equal("123"))
                        expect(dummy?.dummyInt).to(equal(12))
                    }
                }
            }

            context("When callign an request that should fail") {

                beforeEach {
                    service.shouldFail = true
                }

                it("Should return an error") {
                    let requestDummy = HTTPRequestDummy()

                    let requestBuilder = URLRequestBuilder(from: requestDummy)

                    sut.request(requestBuilder: requestBuilder, responseType: CodableJSONBodyDummy.self) { result in
                        guard case .failure(let error) = result else {
                            fail()
                            return
                        }

                        expect(error.localizedDescription).to(equal("undefined error"))
                    }
                }
            }

            context("When callign an request that return notModified as status code") {

                beforeEach {
                    service.statusCode = .notModified
                }

                it("Should return an error") {
                    let requestDummy = HTTPRequestDummy()

                    let requestBuilder = URLRequestBuilder(from: requestDummy)

                    sut.request(requestBuilder: requestBuilder, responseType: CodableJSONBodyDummy.self) { result in
                        guard case .failure(let error) = result else {
                            fail()
                            return
                        }

                        expect(error.localizedDescription).to(equal("Not Modified"))
                    }
                }
            }

            context("When callign an request that return serviceUnavailable as status code") {

                beforeEach {
                    service.statusCode = .serviceUnavailable
                }

                it("Should return an error") {
                    let requestDummy = HTTPRequestDummy()

                    let requestBuilder = URLRequestBuilder(from: requestDummy)

                    sut.request(requestBuilder: requestBuilder, responseType: CodableJSONBodyDummy.self) { result in
                        guard case .failure(let error) = result else {
                            fail()
                            return
                        }

                        expect(error.localizedDescription).to(equal("Service Unavailable"))
                    }
                }
            }

            context("When callign an request that return validationFailed as status code") {

                beforeEach {
                    service.statusCode = .validationFailed
                }

                it("Should return an error") {
                    let requestDummy = HTTPRequestDummy()

                    let requestBuilder = URLRequestBuilder(from: requestDummy)

                    sut.request(requestBuilder: requestBuilder, responseType: CodableJSONBodyDummy.self) { result in
                        guard case .failure(let error) = result else {
                            fail()
                            return
                        }

                        expect(error.localizedDescription).to(equal("Unprocessable Entity"))
                    }
                }
            }

            context("When callign an request that return undefined as status code") {

                beforeEach {
                    service.statusCode = .undefined
                }

                it("Should return an error") {
                    let requestDummy = HTTPRequestDummy()

                    let requestBuilder = URLRequestBuilder(from: requestDummy)

                    sut.request(requestBuilder: requestBuilder, responseType: CodableJSONBodyDummy.self) { result in
                        guard case .failure(let error) = result else {
                            fail()
                            return
                        }

                        expect(error.localizedDescription).to(equal("undefined error"))
                    }
                }
            }
        }
    }
}
