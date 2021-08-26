//
//  ShopListTableViewCell.swift
//  MVCPractice
//
//  Created by 松島悠人 on 2021/08/26.
//

import UIKit

final class ShopListTableViewCell: UITableViewCell {

    static var className: String {
        return String(describing: self)
    }

    static var identifier: String {
        return ShopListTableViewCell.className
    }

    static func nib() -> UINib {
        return UINib(nibName: ShopListTableViewCell.identifier, bundle: nil)
    }
}

