//
//  RepositoryRequestTests.swift
//  RepositoryTests
//
//  Created by pedro.silveira on 19/12/21.
//

import Quick
import Nimble
import Core

@testable import Repository

final class RepositoryRequestTests: QuickSpec {

    override func spec() {

        describe("RepositoryRequest") {

            var sut: RepositoryRequest!

            context("when initiliazed as fetchRepositories") {

                beforeEach {
                    sut = .fetchRepositories(currentPage: 2)
                }

                it("Should generate expected url path") {
                    expect(sut.urlComponents.string).to(equal("https://api.github.com"))
                }

                it("Should generate expected path") {
                    expect(sut.path).to(equal(["/search", "repositories"]))
                }

                it("Should generate expected body") {
                    expect(sut.body).to(beNil())
                }

                it("Should generate expected header") {
                    expect(sut.headers).to(beNil())
                }

                it("Should generate expected methods") {
                    expect(sut.method).to(equal(.get))
                }

                it("Should generate expected query parms") {
                    expect(sut.queryParameters).to(equal(["q": "language: Swift", "sort": "stars", "page": "2"]))
                }
            }
        }
    }
}
