//
//  PullRequestListTableView.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import UIKit

final class PullRequestListTableView: UITableView {

    private let didSelectRowHandler: (IndexPath) -> Void

    private lazy var tableViewDelegate = PullRequestListTableViewDelegate(didSelectRowAt: didSelectRowHandler)

    private var tableViewDataSource: UITableViewDiffableDataSource<Int, PullRequestListTableViewCellViewModel>?

    private var snapshot = NSDiffableDataSourceSnapshot<Int, PullRequestListTableViewCellViewModel>()

    init(didSelectRowHandler: @escaping (IndexPath) -> Void) {
        self.didSelectRowHandler = didSelectRowHandler

        super.init(frame: .zero, style: .plain)

        setupTableView()
        configureDataSource()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTableView() {
        register(PullRequestListTableViewCell.self,
                 forCellReuseIdentifier: PullRequestListTableViewCell.identifier)

        separatorStyle = .singleLine

        delegate = tableViewDelegate
    }

    private func configureDataSource() {
        tableViewDataSource = UITableViewDiffableDataSource<Int, PullRequestListTableViewCellViewModel>(tableView: self) { tableView, index, viewModel -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PullRequestListTableViewCell.identifier, for: index) as? PullRequestListTableViewCell else {
                return nil
            }

            cell.setupCell(with: viewModel)

            return cell
        }

        dataSource = tableViewDataSource

        snapshot.appendSections([0])
    }

    public func updateTableViewContent(with viewModels: [PullRequestListTableViewCellViewModel]) {
        snapshot.appendItems(viewModels)

        tableViewDataSource?.apply(snapshot)
    }
}
