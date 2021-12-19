//
//  EndlessScrollTableViewTests.swift
//  MobileChallengeUITests
//
//  Created by pedro.silveira on 19/12/21.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MobileChallengeUI

final class EndlessScrollTableViewTests: QuickSpec {

    override func spec() {

        describe("EndlessScrollTableView") {

            var sut: EndlessScrollTableView!

            context("when updateTableViewContent is called") {

                beforeEach {
                    let firstViewModel = EndlessScrollTableViewCellViewModel(repositoryName: "some name", repositoryDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", forkScore: 140, starScore: 200, userName: "some name", profileImage: UIImage.checkmark)

                    let secondViewModel = EndlessScrollTableViewCellViewModel(repositoryName: "some name", repositoryDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", forkScore: 140, starScore: 220, userName: "some name", profileImage: UIImage.add)

                    sut = EndlessScrollTableView(didSelectRowHandler: { _ in }, didEndScroll: { })

                    sut.updateTableViewContent(with: [firstViewModel, secondViewModel])

                    sut.frame = UIScreen.main.bounds
                }

                it("Should have expected layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
