//
//  RepositoryCoordinatorTests.swift
//  RepositoryTests
//
//  Created by pedro.silveira on 19/12/21.
//

import Quick
import Nimble
import Core

@testable import Repository

class RepositoryCoordinatorTests: QuickSpec {

    override func spec() {

        describe("RepositoryCoordinator") {

            var sut: RepositoryCoordinator!
            var navigationSpy: NavigationControllerSpy!

            beforeEach {
                navigationSpy = NavigationControllerSpy()
                sut = RepositoryCoordinator(rootViewController: navigationSpy)
            }

            context("When start is called") {

                beforeEach {
                    sut.start { }
                }

                it("Should have called pushViewController") {
                    expect(navigationSpy.isPushViewControllerCalled).to(beTrue())
                }
            }

            context("When goToPullRequestList is called") {

                beforeEach {
                    sut.handle(RepositoryCoordinatorEvents.goToPullRequestList(with: .init(repoOwner: "123", repoName: "123")))
                }

                it("Should have called pushViewController") {
                    expect(navigationSpy.isPushViewControllerCalled).to(beTrue())
                }
            }

            context("When goToPullRequestList is called") {

                beforeEach {
                    sut.handle(RepositoryCoordinatorEvents.showToPullRequestPage(with: URL(fileURLWithPath: "123")))
                }

                it("Should have called present") {
                    expect(navigationSpy.isPresentCalled).to(beTrue())
                }
            }
        }
    }
}
