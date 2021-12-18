//
//  ParentCoordinatorSpy.swift
//  CoreTests
//
//  Created by pedro.silveira on 17/12/21.
//

@testable import Core

final class ParentCoordinatorSpy: Coordinator {

    private let handler: CoordinatorHandlerSpy

    init(handler: CoordinatorHandlerSpy) {
        self.handler = handler

        super.init()

        register(eventType: DummyCoordinatorEvent.self) { _ in self.handler.handler() }
    }
}
