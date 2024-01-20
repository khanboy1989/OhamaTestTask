//
//  ByAppTableViewCell.swift
//  OhanaTestTask
//
//  Created by Serhan Khan on 20/01/2024.
//

import UIKit

class ByAppTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var percentageView: UIView!
    @IBOutlet private var duration: UILabel!
    @IBOutlet private var percentageViewWidthConstraint: NSLayoutConstraint!
    
    func updateView(item: ByApp) {
        titleLabel.text = item.name
        iconImageView.image = item.iconImage
        percentageView.backgroundColor = .purple
        duration.text = item.duration
    }
}
