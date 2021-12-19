//
//  ScoreItem.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 18/12/21.
//

import UIKit
import Core
import SnapKit

enum ScoreItemType {
    case fork
    case star

    var value: String {
        return String(describing: self)
    }
}

final class ScoreItemView: UIView {

    private var type: ScoreItemType

    private var scoreCount: Int

    private lazy var scoreTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .yellow
        label.numberOfLines = 0
        label.text = type.value

        return label
    }()

    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = type.value

        return label
    }()


    init(type: ScoreItemType, scoreCount: Int, frame: CGRect = .zero) {
        self.type = type
        self.scoreCount = scoreCount

        super.init(frame: frame)

        setupView()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ScoreItemView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(scoreTypeLabel)
        addSubview(scoreLabel)
    }

    func setupConstraints() {
        scoreTypeLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(4)
            make.leading.bottom.equalToSuperview()
        }

        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(4)
            make.trailing.bottom.equalToSuperview()
            make.leading.equalTo(scoreTypeLabel.snp.right).offset(2)
        }
    }
}
