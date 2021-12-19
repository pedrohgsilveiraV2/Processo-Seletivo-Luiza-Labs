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

    public func register<Event: CoordinatorEvent>(eventType: Event.Type, handler: @escaping (Event) -> Void) {
        self.registeredEvents[eventType.key] = { event in
            if let event = event as? Event {
                handler(event)
            }
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

    open func start(_ completion: (() -> Void)?) {
        guard let completion = completion else { return }

        completion()
    }
}
