//
//  CoordinatorTests.swift
//  CoreTests
//
//  Created by pedro.silveira on 17/12/21.
//

import Quick
import Nimble

@testable import Core

final class CoordinatorTests: QuickSpec {

    override func spec() {

        describe("Coordinator") {

            var sut: Coordinator!

            context("When calling start") {

                var coordinatorHandlerSpy: CoordinatorHandlerSpy!

                beforeEach {
                    coordinatorHandlerSpy = CoordinatorHandlerSpy()

                    sut = Coordinator()

                    sut.start(coordinatorHandlerSpy.handler)
                }

                it("Should have executed the desired closure") {
                    expect(coordinatorHandlerSpy.didHandleEvent).to(beTrue())
                }
            }

            context("When handling an registered event") {

                var coordinatorHandlerSpy: CoordinatorHandlerSpy!

                beforeEach {
                    coordinatorHandlerSpy = CoordinatorHandlerSpy()

                    sut = Coordinator()

                    sut.register(eventType: DummyCoordinatorEvent.self) { _ in coordinatorHandlerSpy.handler() }

                    sut.handle(DummyCoordinatorEvent.dummyEvent)
                }

                it("Should have executed the desired closure") {
                    expect(coordinatorHandlerSpy.didHandleEvent).to(beTrue())
                }
            }

            context("When handling an unregistered event") {

                var coordinatorHandlerSpy: CoordinatorHandlerSpy!

                beforeEach {
                    coordinatorHandlerSpy = CoordinatorHandlerSpy()

                    sut = Coordinator()

                    sut.handle(DummyCoordinatorEvent.dummyEvent)
                }

                it("Shouldn't have executed the desired closure") {
                    expect(coordinatorHandlerSpy.didHandleEvent).to(beNil())
                }
            }

            context("When handling an unregistered event but with parent registering him") {

                var coordinatorHandlerSpy: CoordinatorHandlerSpy!

                beforeEach {
                    coordinatorHandlerSpy = CoordinatorHandlerSpy()

                    let parentCoordinator = ParentCoordinatorSpy(handler: coordinatorHandlerSpy)

                    sut = Coordinator(parentCoordinator: parentCoordinator)

                    sut.handle(DummyCoordinatorEvent.dummyEvent)
                }

                it("Should have executed the desired closure") {
                    expect(coordinatorHandlerSpy.didHandleEvent).to(beTrue())
                }
            }
        }
    }
}

