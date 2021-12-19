//
//  UserProfileView.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 18/12/21.
//

import UIKit
import Core

final class UserProfileView: UIStackView {

    private let viewModel: UserProfileViewModel

    private lazy var profileImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = viewModel.userImage

        return view
    }()

    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .blue
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = viewModel.userName

        return label
    }()

    private lazy var userFullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = viewModel.userFullName

        return label
    }()


    init(viewModel: UserProfileViewModel, frame: CGRect = .zero) {
        self.viewModel = viewModel

        super.init(frame: frame)

        setupView()
    }

    @available (*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserProfileView: ViewCodable {
    func buildViewHierarchy() {
        addArrangedSubview(profileImageView)
        addArrangedSubview(userNameLabel)
        addArrangedSubview(userFullNameLabel)
    }

    func setupConstraints() { }

    func setupAdditionalConfiguration() {
        axis = .vertical
        spacing = 2
    }
}
