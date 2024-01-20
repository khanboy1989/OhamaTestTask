//
//  ByCategoryTableViewCell.swift
//  OhanaTestTask
//
//  Created by Serhan Khan on 20/01/2024.
//

import UIKit

class ByCategoryTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private var categoryIndicator: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var percentageLabel: UILabel!
    @IBOutlet private var numberOfAppsLabel: UILabel!
    @IBOutlet private var durationLabel: UILabel!

    func updateView(item: ByCategory) {
        titleLabel.text = item.type.title
        percentageLabel.text = item.percentage.description
        numberOfAppsLabel.text = item.count.description + "Apps"
        categoryIndicator.backgroundColor = item.type.color
    }
}
