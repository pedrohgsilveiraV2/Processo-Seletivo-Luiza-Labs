//
//  UserProfileView.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 18/12/21.
//

import UIKit
import Core

final class UserProfileView: UIStackView {

    private lazy var profileImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit

        return view
    }()

    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .blue
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()

    override init(frame: CGRect = .zero) {

        super.init(frame: frame)

        setupView()
    }

    @available (*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateValues(with viewModel: UserProfileViewModel) {
        profileImageView.image = viewModel.userImage
        userNameLabel.text = viewModel.userName
    }
}

extension UserProfileView: ViewCodable {
    func buildViewHierarchy() {
        addArrangedSubview(profileImageView)
        addArrangedSubview(userNameLabel)
    }

    func setupConstraints() { }

    func setupAdditionalConfiguration() {
        axis = .vertical
        spacing = 2
    }
}
