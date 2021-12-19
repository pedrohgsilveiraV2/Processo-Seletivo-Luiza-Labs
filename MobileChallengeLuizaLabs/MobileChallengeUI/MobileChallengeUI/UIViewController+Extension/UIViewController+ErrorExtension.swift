//
//  UIViewController+ErrorExtension.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 19/12/21.
//

import UIKit

extension UIViewController {

    public func showErrorView(completion: @escaping (() -> Void)) {
        let errorView = GenericErrorView(retryAction: completion)
        self.view.addSubview(errorView)
        errorView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
