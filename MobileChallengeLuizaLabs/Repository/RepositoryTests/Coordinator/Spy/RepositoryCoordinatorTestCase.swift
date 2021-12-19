//
//  RepositoryCoordinatorTestCase.swift
//  RepositoryTests
//
//  Created by pedro.silveira on 19/12/21.
//

import UIKit

final class NavigationControllerSpy: UINavigationController {

    private(set) var isPresentCalled: Bool

    private(set) var isDismissCalled: Bool

    private(set) var isShowCalled: Bool

    private(set) var isShowDetailViewControllerCalled: Bool

    private(set) var isPushViewControllerCalled: Bool

    private(set) var isPopViewControllerCalled: Bool

    private(set) var isSetViewControllersCalled: Bool

    private(set) var isPopToRootViewControllerCalled: Bool

    private(set) var isPopToViewControllerCalled: Bool

    private(set) var presentViewController: UIViewController?

    private(set) var showViewController: UIViewController?

    private(set) var showDetailViewController: UIViewController?

    private(set) var pushViewController: UIViewController?

    var isInWindow: Bool {
        return view.window != nil
    }

    init() {
        isPresentCalled = false
        isDismissCalled = false
        isShowCalled = false
        isShowDetailViewControllerCalled = false
        isPushViewControllerCalled = false
        isPopViewControllerCalled = false
        isSetViewControllersCalled = false
        isPopToRootViewControllerCalled = false
        isPopToViewControllerCalled = false
        super.init(nibName: nil, bundle: nil)
    }

    convenience override init(rootViewController: UIViewController) {
        self.init()
        super.setViewControllers([rootViewController], animated: false)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        isPresentCalled = true
        presentViewController = viewControllerToPresent

        if isInWindow {
            super.present(viewControllerToPresent, animated: false, completion: completion)
        }
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        isDismissCalled = true

        if isInWindow {
            super.dismiss(animated: false)
            completion?()
        }
    }

    override func show(_ vc: UIViewController, sender: Any?) {
        isShowCalled = true
        showViewController = vc

        if isInWindow {
            super.show(vc, sender: sender)
        }
    }

    override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        isShowDetailViewControllerCalled = true
        showDetailViewController = vc

        if isInWindow {
            super.show(vc, sender: sender)
        }
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        isPushViewControllerCalled = true
        pushViewController = viewController

        if isInWindow {
            super.pushViewController(viewController, animated: false)
        }
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        isPopViewControllerCalled = true

        if isInWindow {
            return super.popViewController(animated: false)
        }

        return nil
    }

    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        isPopToRootViewControllerCalled = true

        if isInWindow {
            return super.popToRootViewController(animated: false)
        }

        return nil
    }

    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        isPopToViewControllerCalled = true

        if isInWindow {
            return super.popToViewController(viewController, animated: false)
        }

        return nil
    }

    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        isSetViewControllersCalled = true

        if isInWindow {
            super.setViewControllers(viewControllers, animated: false)
        }
    }
}
