//
//  ShopListTableViewCell.swift
//  MVCPractice
//
//  Created by 松島悠人 on 2021/08/26.
//

import UIKit

final class ShopListTableViewCell: UITableViewCell {

    @IBOutlet private weak var shopImageView: UIImageView!
    @IBOutlet private weak var shopNameLabel: UILabel!
    @IBOutlet private weak var shopAccessLabel: UILabel!
    static var className: String {
        return String(describing: self)
    }

    static var identifier: String {
        return ShopListTableViewCell.className
    }

    static func nib() -> UINib {
        return UINib(nibName: ShopListTableViewCell.identifier, bundle: nil)
    }

    func configure(shopName: String, shopAccess: String, shopImageData: Data) {
        shopNameLabel.text = shopName
        shopAccessLabel.text = shopAccess
        shopImageView.image = UIImage(data: shopImageData)
    }
}

