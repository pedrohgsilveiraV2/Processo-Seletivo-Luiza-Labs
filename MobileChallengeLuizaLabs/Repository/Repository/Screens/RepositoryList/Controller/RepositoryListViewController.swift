//
//  RepositoryListViewController.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import Core
import UIKit
import MobileChallengeUI

final class RepositoryListViewController: UIViewController {

    // MARK: - Properties
    private let provider: RepositoryListProviderProtocol

    private var state: RepositoryListState = .initialState

    private var didFinishRequest: Bool = true

    private var credentials: [PullRequestCredentials] = []

    private lazy var mainView: RepositoryListView = {
        let view = RepositoryListView()
        view.delegate = self

        return view
    }()

    // MARK: - Life Cycle
    init(provider: RepositoryListProviderProtocol = RepositoryListProvider()) {
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

        handleState()
    }
}

extension RepositoryListViewController {
    private func handleState() {
        guard let command = state.handleEvent(event: .didEndScroll) else { return }

        if case .updateValues(let page) = command {
            didFinishRequest = false
            fetchRepositories(with: page)
        }
    }
}

// MARK: Network Handler
extension RepositoryListViewController {
    private func fetchRepositories(with page: Int) {
        startLoading()

        provider.fetchRepositories(currentPage: page) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let repositories):

                let viewModels: [EndlessScrollTableViewCellViewModel] = repositories.items.map {

                    let imageURL = URL(string: $0.owner.ownerProfileAvatarPath)

                    if let url = imageURL, let data = try? Data(contentsOf: url) {

                        let image: UIImage = UIImage(data: data) ?? UIImage()

                        return EndlessScrollTableViewCellViewModel(repositoryName: $0.name, repositoryDescription: $0.description, forkScore: $0.forksCount, starScore: $0.stargazersCount, userName: $0.owner.ownerName, profileImage: image)
                    }

                    return EndlessScrollTableViewCellViewModel(repositoryName: $0.name, repositoryDescription: $0.description, forkScore: $0.forksCount, starScore: $0.stargazersCount, userName: $0.owner.ownerName, profileImage: UIImage())
                }

                viewModels.forEach {
                    let credential = PullRequestCredentials(repoOwner: $0.userName, repoName: $0.repositoryName)

                    self.credentials.append(credential)
                }

                self.stopLoading()
                self.mainView.updateRepositoryContent(with: viewModels)
                self.didFinishRequest = true
            case .failure(let error):
                debugPrint(error)
                break
            }
        }
    }
}

// MARK: - Repository List View Delegate Methods
extension RepositoryListViewController: RepositoryListViewDelegate {
    func didSelectRow(at indexPath: IndexPath) {
        return
    }

    func didEndScroll() {
        if didFinishRequest {
            handleState()
        }
    }
}
