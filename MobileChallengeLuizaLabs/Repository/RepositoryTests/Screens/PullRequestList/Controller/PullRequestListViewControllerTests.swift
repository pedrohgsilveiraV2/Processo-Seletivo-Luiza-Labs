//
//  PullRequestListViewControllerTests.swift
//  RepositoryTests
//
//  Created by pedro.silveira on 19/12/21.
//

import Quick
import Nimble
import Nimble_Snapshots
import Core

@testable import Repository

final class PullRequestListViewControllerTests: QuickSpec {

    override func spec() {

        describe("PullRequestListViewController") {

            var sut: PullRequestListViewController!

            context("When initialized with success") {

                beforeEach {
                    let firstItem = PullRequestItemResponse(pullRequestPath: "www.google.com", title: "SomeTitle", owner: .init(ownerName: "Some Name", ownerProfileAvatarPath: ""), description: "Some Description")

                    let secondItem = PullRequestItemResponse(pullRequestPath: "www.google.com", title: "SomeTitle2", owner: .init(ownerName: "Some Name2", ownerProfileAvatarPath: ""), description: "Some Description2")

                    let provider = PullRequestListProviderStub(fetchPullRequestResult: .success([firstItem, secondItem]))

                    sut = PullRequestListViewController(credentials: .init(repoOwner: "123", repoName: "123"), provider: provider)

                    sut.beginAppearanceTransition(true, animated: true)

                    sut.view.frame = UIScreen.main.bounds
                }

                it("Should have expected layout") {
                    expect(sut) == snapshot()
                }
            }

            context("When initialized with failure") {

                beforeEach {
                    let provider = PullRequestListProviderStub(fetchPullRequestResult: .failure(NetworkError(statusCode: 0)))

                    sut = PullRequestListViewController(credentials: .init(repoOwner: "123", repoName: "123"), provider: provider)

                    sut.beginAppearanceTransition(true, animated: true)

                    sut.view.frame = UIScreen.main.bounds
                }

                it("Should have expected layout") {
                    expect(sut) == snapshot()
                }
            }

            context("When didSelectRow is called") {

                var coordinatorSpy: RepositoryCoordinatorSpy!

                beforeEach {
                    coordinatorSpy = RepositoryCoordinatorSpy()

                    let firstItem = PullRequestItemResponse(pullRequestPath: "www.google.com", title: "SomeTitle", owner: .init(ownerName: "Some Name", ownerProfileAvatarPath: ""), description: "Some Description")

                    let secondItem = PullRequestItemResponse(pullRequestPath: "www.google.com", title: "SomeTitle2", owner: .init(ownerName: "Some Name2", ownerProfileAvatarPath: ""), description: "Some Description2")

                    let provider = PullRequestListProviderStub(fetchPullRequestResult: .success([firstItem, secondItem]))

                    sut = PullRequestListViewController(credentials: .init(repoOwner: "123", repoName: "123"), provider: provider)

                    sut.coordinator = coordinatorSpy

                    sut.beginAppearanceTransition(true, animated: true)

                    sut.view.frame = UIScreen.main.bounds

                    sut.didSelectRow(at: .init(row: 0, section: 1))
                }

                it("Should have called coordinator with correct event") {
                    expect(coordinatorSpy.receivedEvent).to(equal(RepositoryCoordinatorEvents.showToPullRequestPage(with: URL(fileURLWithPath: "12"))))
                }
            }
        }
    }
}
