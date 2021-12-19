//
//  EndlessScrollTableViewDataSource.swift
//  MobileChallengeUI
//
//  Created by pedro.silveira on 18/12/21.
//

import UIKit

final class EndlessScrollTableViewDataSource<DataSourceModel: Hashable>: UITableViewDiffableDataSource<Int, DataSourceModel> {

    private let items: [DataSourceModel]

    init(items: [DataSourceModel],
         owner: UITableView) {
        self.items = items

        super.init(tableView: owner) { tableView, indexPath, itemIdentifier -> UITableViewCell? in

            return nil
        }
    }

}
