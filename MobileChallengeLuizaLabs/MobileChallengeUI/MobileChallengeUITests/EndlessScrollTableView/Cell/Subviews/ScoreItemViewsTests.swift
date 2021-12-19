//
//  ScoreItemViewsTests.swift
//  MobileChallengeUITests
//
//  Created by pedro.silveira on 18/12/21.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MobileChallengeUI

final class ScoreItemViewTests: QuickSpec {

    override func spec() {

        describe("ScoreItemView") {

            var sut: ScoreItemView!

            context("When initialized with fork as value") {

                beforeEach {
                    sut = ScoreItemView(type: .fork, scoreCount: 100)
                    sut.frame = .init(x: 0, y: 0, width: 60, height: 22)
                }

                it("Should have expected layout") {
                    expect(sut) == snapshot()
                }
            }

            context("When initialized with star as value") {

                beforeEach {
                    sut = ScoreItemView(type: .star, scoreCount: 100)
                    sut.frame = .init(x: 0, y: 0, width: 60, height: 22)
                }

                it("Should have expected layout") {
                    expect(sut) == snapshot()
                }
            }

        }
    }
}
