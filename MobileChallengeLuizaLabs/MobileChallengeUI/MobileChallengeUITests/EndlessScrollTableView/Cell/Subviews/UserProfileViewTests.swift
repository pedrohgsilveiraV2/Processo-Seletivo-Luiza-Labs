//
//  UserProfileViewTests.swift
//  MobileChallengeUITests
//
//  Created by pedro.silveira on 18/12/21.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MobileChallengeUI

final class UserProfileViewTests: QuickSpec {

    override func spec() {

        describe("UserProfileView") {

            var sut: UserProfileView!

            context("When initialized") {

                beforeEach {
                    let viewModel = UserProfileViewModel(userImage: UIImage.init(systemName: "circle") ?? UIImage(),
                                                         userName: "some user name")

                    sut = UserProfileView()

                    sut.updateValues(with: viewModel)

                    sut.frame = .init(x: 0, y: 0, width: 140, height: 120)
                }

                it("Should have expected layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
