//
//  PullRequestListTableViewCell.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import UIKit
import Core

final class PullRequestListTableViewCell: UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }

    private var pullRequestTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .blue
        label.numberOfLines = 0

        return label
    }()

    private var pullRequestDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2

        return label
    }()

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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(with viewModel: PullRequestListTableViewCellViewModel) {

        pullRequestTitleLabel.text = viewModel.pullRequestTitle
        pullRequestDescriptionLabel.text = viewModel.pullRequestDescription
        profileImageView.image = viewModel.profileImage
        userNameLabel.text = viewModel.userName
    }
}

extension PullRequestListTableViewCell: ViewCodable {
    func buildViewHierarchy() {
        contentView.addSubview(pullRequestTitleLabel)
        contentView.addSubview(pullRequestDescriptionLabel)
        contentView.addSubview(profileImageView)
        contentView.addSubview(userNameLabel)
    }

    func setupConstraints() {
        pullRequestTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
        }

        pullRequestDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(pullRequestTitleLabel.snp.bottom).offset(4)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
        }

        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(pullRequestDescriptionLabel.snp.bottom).offset(6)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-24)
        }

        userNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView.snp.centerY)
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
        }
    }

    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .white
    }
}
