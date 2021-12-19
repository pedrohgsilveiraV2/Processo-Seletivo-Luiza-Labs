//
//  PullRequestListTableViewDelegate.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import UIKit

final class PullRequestListTableViewDelegate: NSObject, UITableViewDelegate {

    private var didSelectRowAt: (IndexPath) -> Void

    init(didSelectRowAt: @escaping (IndexPath) -> Void) {
        self.didSelectRowAt = didSelectRowAt

        super.init()
    }

    enum Constants {
        static let rowHeight: CGFloat = 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAt(indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }
}
