//
//  RepositoryListView.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core
import MobileChallengeUI
import UIKit

protocol RepositoryListViewDelegate: AnyObject {
    func didSelectRow(at indexPath: IndexPath)
    func didEndScroll()
}

final class RepositoryListView: UIView {

    weak var delegate: RepositoryListViewDelegate?

    private lazy var didSelectRowHandler: (IndexPath) -> Void = { [weak self] indexPath in
        guard let self = self else { return }
        self.delegate?.didSelectRow(at: indexPath)
    }

    private lazy var didEndScrollHandler: () -> Void = { [weak self] in
        guard let self = self else { return }
        self.delegate?.didEndScroll()
    }

    private lazy var tableView: EndlessScrollTableView = EndlessScrollTableView(didSelectRowHandler: didSelectRowHandler, didEndScroll: didEndScrollHandler)

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateRepositoryContent(with viewModel: [EndlessScrollTableViewCellViewModel]) {
        tableView.updateTableViewContent(with: viewModel)
    }
}

extension RepositoryListView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
