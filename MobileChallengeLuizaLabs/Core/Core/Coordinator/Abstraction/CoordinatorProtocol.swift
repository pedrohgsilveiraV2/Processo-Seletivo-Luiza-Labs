//
//  CoordinatorProtocol.swift
//  Core
//
//  Created by pedro.silveira on 17/12/21.
//

public protocol CoordinatorProtocol: AnyObject {
    var parentCoordinator: CoordinatorProtocol? { get }

    func handle(event: CoordinatorEvent)
    func start(_ completion: @escaping () -> Void)
}

public extension CoordinatorProtocol {
    var parentCoordinator: CoordinatorProtocol? { return nil }
}
