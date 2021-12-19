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
                                                         userName: "some user name",
                                                         userFullName: "some full name")

                    sut = UserProfileView(viewModel: viewModel)
                    sut.frame = .init(x: 0, y: 0, width: 200, height: 240)
                }

                it("Should have expected layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
