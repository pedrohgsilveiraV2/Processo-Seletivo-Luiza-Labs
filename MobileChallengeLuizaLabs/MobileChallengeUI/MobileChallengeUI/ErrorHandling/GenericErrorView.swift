//
//  GenericErrorView.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 19/12/21.
//

import Core
import UIKit

final class GenericErrorView: UIView {

    private let retryAction: () -> Void

    private var errorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .black
        label.text = L10n.genericErrorViewDescription
        label.numberOfLines = 0

        return label
    }()

    private lazy var retryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .blue
        label.text = L10n.genericErrorViewRetryActionDescription
        let gesture = UIGestureRecognizer(target: self, action: #selector(retryLabelHasBeenClicked))
        label.addGestureRecognizer(gesture)

        return label
    }()

    init(retryAction: @escaping () -> Void, frame: CGRect = .zero) {
        self.retryAction = retryAction

        super.init(frame: frame)

        setupView()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    @objc private func retryLabelHasBeenClicked() {
        removeFromSuperview()
        retryAction()
    }
}

extension GenericErrorView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(errorLabel)
        addSubview(retryLabel)
    }

    func setupConstraints() {
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(60)
            make.centerX.equalToSuperview()
            make.leading.equalTo(snp.leading).offset(24)
            make.trailing.equalTo(snp.trailing).offset(-24)
        }

        retryLabel.snp.makeConstraints { make in
            make.top.equalTo(errorLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
