//
//  CoordinatorHandlerSpy.swift
//  CoreTests
//
//  Created by pedro.silveira on 17/12/21.
//

final class CoordinatorHandlerSpy {

    private(set) var didHandleEvent: Bool?

    lazy var handler: () -> Void = { self.didHandleEvent = true }
}
