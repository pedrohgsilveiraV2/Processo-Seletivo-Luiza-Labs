//
//  PullRequestListViewController.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core
import UIKit
import MobileChallengeUI

final class PullRequestListViewController: UIViewController {

    // MARK: - Properties
    var coordinator: CoordinatorProtocol?

    private let provider: PullRequestListProviderProtocol

    private let credentials: PullRequestCredentials

    private var pullRequestsUrlPaths: [String] = []

    private lazy var mainView: PullRequestListView = {
        let view = PullRequestListView()
        view.delegate = self

        return view
    }()

    // MARK: - Life Cycle
    init(credentials: PullRequestCredentials,
         provider: PullRequestListProviderProtocol = PullRequestListProvider()) {
        self.credentials = credentials
        self.provider = provider

        super.init(nibName: nil, bundle: nil)
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchRepositories()
    }
}

// MARK: Network Handler
extension PullRequestListViewController {
    private func fetchRepositories() {
        startLoading()

        provider.fetchPullRequest(credentials: credentials) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let pullRequests):
                let viewModels: [PullRequestListTableViewCellViewModel] = pullRequests.map {
                    let imageURL = URL(string: $0.owner.ownerProfileAvatarPath)

                    if let url = imageURL, let data = try? Data(contentsOf: url) {
                        let image: UIImage = UIImage(data: data) ?? UIImage()

                        return PullRequestListTableViewCellViewModel(pullRequestTitle: $0.title, pullRequestDescription: $0.description, userName: $0.owner.ownerName, profileImage: image)
                    }

                    return PullRequestListTableViewCellViewModel(pullRequestTitle: $0.title, pullRequestDescription: $0.description, userName: $0.owner.ownerName, profileImage: UIImage())
                }

                pullRequests.forEach {
                    self.pullRequestsUrlPaths.append($0.pullRequestPath)
                }

                self.stopLoading()
                self.mainView.updatePullRequestContent(with: viewModels)
            case .failure(let error):
                debugPrint(error)
                break
            }
        }
    }
}

// MARK: - Repository List View Delegate Methods
extension PullRequestListViewController: PullRequestListViewDelegate {
    func didSelectRow(at indexPath: IndexPath) {
        let currentPath = pullRequestsUrlPaths[indexPath.row]

        if let currentUrl = URL(string: currentPath) {
            coordinator?.handle(RepositoryCoordinatorEvents.showToPullRequestPage(with: currentUrl))
        }
    }
}
