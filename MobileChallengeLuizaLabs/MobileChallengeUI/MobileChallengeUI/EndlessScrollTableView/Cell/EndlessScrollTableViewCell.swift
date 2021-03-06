//
//  EndlessScrollTableViewCell.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 18/12/21.
//

import UIKit
import Core

final class EndlessScrollTableViewCell: UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }

    private var repositoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .blue
        label.numberOfLines = 0

        return label
    }()

    private var repositoryDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 3

        return label
    }()

    private var forkScoreView = ScoreItemView(type: .fork)

    private var starScoreView = ScoreItemView(type: .star)

    private var profileView = UserProfileView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(with viewModel: EndlessScrollTableViewCellViewModel) {
        let profileViewModel = UserProfileViewModel(userImage: viewModel.profileImage, userName: viewModel.userName)

        repositoryNameLabel.text = viewModel.repositoryName
        repositoryDescriptionLabel.text = viewModel.repositoryDescription
        forkScoreView.update(with: viewModel.forkScore)
        starScoreView.update(with: viewModel.starScore)
        profileView.updateValues(with: profileViewModel)
    }
}

extension EndlessScrollTableViewCell: ViewCodable {
    func buildViewHierarchy() {
        contentView.addSubview(repositoryNameLabel)
        contentView.addSubview(repositoryDescriptionLabel)
        contentView.addSubview(forkScoreView)
        contentView.addSubview(starScoreView)
        contentView.addSubview(profileView)
    }

    func setupConstraints() {
        repositoryNameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24)
            make.leading.equalTo(contentView.snp.leading).offset(16)
        }

        repositoryDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(repositoryNameLabel.snp.bottom).offset(4)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.72)
            make.leading.equalTo(contentView.snp.leading).offset(16)
        }

        forkScoreView.snp.makeConstraints { make in
            make.top.equalTo(repositoryDescriptionLabel.snp.bottom).offset(4)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-24)
        }

        starScoreView.snp.makeConstraints { make in
            make.top.equalTo(repositoryDescriptionLabel.snp.bottom).offset(4)
            make.leading.equalTo(forkScoreView.snp.trailing).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-24)
        }

        profileView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24)
            make.leading.equalTo(repositoryDescriptionLabel.snp.trailing).offset(12)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-24)
        }
    }

    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .white
    }
}
