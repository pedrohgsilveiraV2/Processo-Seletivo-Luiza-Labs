//
//  RepositoryListState.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core

import Core

struct RepositoryListStateHandler: StateHandler {

    func setState<T>(_ state: T) -> T? where T: StateAbstraction {
        guard let repositoryListState = state as? RepositoryListState else { return nil }

        switch repositoryListState {
        case .initialState:
            return RepositoryListState.manipulated(currentValue: 2) as? T
        case .manipulated(let currentValue):
            return RepositoryListState.manipulated(currentValue: currentValue + 1) as? T
        }
    }
}

enum RepositoryListState: StateAbstraction {

    var stateHandler: StateHandler? {
        RepositoryListStateHandler()
    }

    case initialState
    case manipulated(currentValue: Int)

    public enum InputEvent {
        case didEndScroll
    }

    /// State actions
    public enum OutputAction {
        case updateValues(withPage: Int)
    }

    /// Method responsable for handling state events
    public mutating func handleEvent(event: InputEvent) -> OutputAction? {
        switch (self, event) {
        case (.initialState, .didEndScroll):
            self = stateHandler?.setState(self) ?? .manipulated(currentValue: 1)
            return .updateValues(withPage: 1)
        case (.manipulated(let currentValue), .didEndScroll):
            self = stateHandler?.setState(self) ?? .manipulated(currentValue: currentValue)
            return .updateValues(withPage: currentValue)
        }
    }
}
