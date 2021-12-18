//
//  CoordinatorEvent.swift
//  Core
//
//  Created by pedro.silveira on 17/12/21.
//

public struct CoordinatorEventType: Hashable {

    typealias CoordinatorType = CoordinatorEvent.Type

    private let wrappedValue: CoordinatorType

    init(_ type: CoordinatorType) {
        wrappedValue = type
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(wrappedValue).hashValue)
    }

    public static func == (lhs: CoordinatorEventType, rhs: CoordinatorEventType) -> Bool {
        return lhs.wrappedValue == rhs.wrappedValue
    }
}

public protocol CoordinatorEvent {}

public extension CoordinatorEvent {
    var key: CoordinatorEventType { return CoordinatorEventType(type(of: self)) }
    static var key: CoordinatorEventType { return CoordinatorEventType(self) }
}
