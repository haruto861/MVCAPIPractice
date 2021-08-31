//
//  Storyboard+.swift
//  MVCPractice
//
//  Created by 松島悠人 on 2021/08/26.
//

import Foundation
import UIKit

extension UIStoryboard {

    static var shopListViewController: ShopListViewController {
        return UIStoryboard(name: "ShopList", bundle: nil).instantiateInitialViewController() as! ShopListViewController
    }
}
