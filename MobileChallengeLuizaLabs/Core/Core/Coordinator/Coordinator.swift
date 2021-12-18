//
//  Coordinator.swift
//  Core
//
//  Created by pedro.silveira on 17/12/21.
//

open class Coordinator: CoordinatorProtocol {

    public let parentCoordinator: CoordinatorProtocol?

    private var registeredEvents: [CoordinatorEventType: (CoordinatorEvent) -> Void] = [:]

    public init(parentCoordinator: CoordinatorProtocol?) {
        self.parentCoordinator = parentCoordinator
    }

    public init() {
        self.parentCoordinator = nil
    }

    public func register(eventType: CoordinatorEvent.Type, handler: @escaping (CoordinatorEvent) -> Void) {
        registeredEvents[eventType.key] = { event in
            handler(event)
        }
    }

    private func handleWithParentCoordinator(_ event: CoordinatorEvent) {
        parentCoordinator?.handle(event)
    }

    open func handle(_ event: CoordinatorEvent) {
        guard let handler = registeredEvents[event.key] else {
            handleWithParentCoordinator(event)
            return
        }

        handler(event)
    }

    public func start(_ completion: (() -> Void)?) {
        guard let completion = completion else { return }

        completion()
    }
}
