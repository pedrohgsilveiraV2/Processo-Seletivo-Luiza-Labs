//
//  PullRequestListView.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core
import MobileChallengeUI
import UIKit

protocol PullRequestListViewDelegate: AnyObject {
    func didSelectRow(at indexPath: IndexPath)
}

final class PullRequestListView: UIView {

    // MARK: - Properties
    weak var delegate: PullRequestListViewDelegate?

    private lazy var didSelectRowHandler: (IndexPath) -> Void = { [weak self] indexPath in
        guard let self = self else { return }
        self.delegate?.didSelectRow(at: indexPath)
    }

    private lazy var tableView = PullRequestListTableView(didSelectRowHandler: didSelectRowHandler)

    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updatePullRequestContent(with viewModel: [PullRequestListTableViewCellViewModel]) {
        tableView.updateTableViewContent(with: viewModel)
    }
}

// MARK: - View Codable Methods
extension PullRequestListView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
