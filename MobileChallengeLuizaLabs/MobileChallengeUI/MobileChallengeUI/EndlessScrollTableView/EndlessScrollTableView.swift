//
//  EndlessScrollTableView.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 18/12/21.
//

import UIKit

public final class EndlessScrollTableView: UITableView {

    private let didSelectRowHandler: (IndexPath) -> Void

    private let didEndScroll: () -> Void

    private lazy var tableViewDelegate = EndlessScrollTableViewDelegate(didSelectRowAt: didSelectRowHandler, didEndScroll: didEndScroll)

    private var tableViewDataSource: UITableViewDiffableDataSource<Int, EndlessScrollTableViewCellViewModel>?

    private var snapshot = NSDiffableDataSourceSnapshot<Int, EndlessScrollTableViewCellViewModel>()

    public init(didSelectRowHandler: @escaping (IndexPath) -> Void,
         didEndScroll: @escaping () -> Void) {
        self.didSelectRowHandler = didSelectRowHandler
        self.didEndScroll = didEndScroll

        super.init(frame: .zero, style: .plain)

        setupTableView()
        configureDataSource()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTableView() {
        register(EndlessScrollTableViewCell.self,
                 forCellReuseIdentifier: EndlessScrollTableViewCell.identifier)
        
        separatorStyle = .singleLine

        delegate = tableViewDelegate
    }

    private func configureDataSource() {
        tableViewDataSource = UITableViewDiffableDataSource<Int, EndlessScrollTableViewCellViewModel>(tableView: self) { tableView, index, viewModel -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EndlessScrollTableViewCell.identifier, for: index) as? EndlessScrollTableViewCell else {
                return nil
            }

            cell.setupCell(with: viewModel)

            return cell
        }

        dataSource = tableViewDataSource

        snapshot.appendSections([0])
    }

    public func updateTableViewContent(with viewModels: [EndlessScrollTableViewCellViewModel]) {
        snapshot.appendItems(viewModels)

        tableViewDataSource?.apply(snapshot)
    }
}
