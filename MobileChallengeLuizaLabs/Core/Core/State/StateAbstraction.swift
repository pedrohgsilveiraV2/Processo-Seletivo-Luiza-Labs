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

/// An abstraction for state handlers
public protocol StateHandler {

    /// The function of this method is to deal with the current state, that is, to make changes if necessary.
    func setState<T: StateAbstraction>(_ state: T) -> T?
}
