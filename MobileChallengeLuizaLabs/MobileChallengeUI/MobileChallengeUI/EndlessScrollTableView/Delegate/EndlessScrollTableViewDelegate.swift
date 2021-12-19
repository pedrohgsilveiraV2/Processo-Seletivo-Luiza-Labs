//
//  EndlessScrollTableViewDelegate.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 18/12/21.
//

import UIKit

final class EndlessScrollTableViewDelegate: NSObject, UITableViewDelegate {

    private var didSelectRowAt: (IndexPath) -> Void

    private var didEndScroll: () -> Void

    init(didSelectRowAt: @escaping (IndexPath) -> Void,
         didEndScroll: @escaping () -> Void) {
        self.didSelectRowAt = didSelectRowAt
        self.didEndScroll = didEndScroll

        super.init()
    }

    enum Constants {
        static let rowHeight: CGFloat = 160
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAt(indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height

        let contentYoffset = scrollView.contentOffset.y

        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        
        if distanceFromBottom <= scrollViewHeight {
            didEndScroll()
        }
    }
}
