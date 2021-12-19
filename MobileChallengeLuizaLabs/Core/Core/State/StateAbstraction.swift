//
//  StateAbstraction.swift
//  Core
//
//  Created by pedro.silveira on 18/12/21.
//

public protocol StateAbstraction {

    associatedtype InputEvent

    associatedtype OutputAction

    mutating func handleEvent(event: InputEvent) -> OutputAction?

    var stateHandler: StateHandler? { get }
}

public protocol StateHandler {
    func setState<T: StateAbstraction>(_ state: T) -> T?
}
