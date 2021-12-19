//
//  PullRequestPageViewController.swift
//  Repository
//
//  Created by pedro.silveira on 19/12/21.
//

import UIKit
import WebKit

final class PullRequestPageViewController: UIViewController {

    private let pullRequestUrl: URL

    private lazy var webView: WKWebView? = {
        let view = WKWebView()
        view.navigationDelegate = self
        view.load(URLRequest(url: pullRequestUrl))
        view.allowsBackForwardNavigationGestures = true

        return view

    }()

    init(pullRequestUrl: URL) {
        self.pullRequestUrl = pullRequestUrl

        super.init(nibName: nil, bundle: nil)
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = webView
    }
}

extension PullRequestPageViewController: WKNavigationDelegate {

}
