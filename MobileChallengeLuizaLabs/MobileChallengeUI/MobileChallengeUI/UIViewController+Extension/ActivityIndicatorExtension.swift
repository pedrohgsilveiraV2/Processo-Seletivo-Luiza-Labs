//
//  ActivityIndicatorExtension.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 19/12/21.
//

import UIKit

extension UIViewController {

    enum AssociatedKey {
        static var loader: UInt8 = 0
    }

    private(set) var activityIndicator: UIActivityIndicatorView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.loader) as? UIActivityIndicatorView
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKey.loader, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    public func startLoading() {
        stopLoading()
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        self.activityIndicator = activityIndicator
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

    public func stopLoading() {
        guard let activityIndicator = self.activityIndicator else { return }
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        self.activityIndicator = nil
    }
}
