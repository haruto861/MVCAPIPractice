//
//  Router.swift
//  MVCPractice
//
//  Created by 松島悠人 on 2021/08/26.
//

import Foundation
import UIKit

final class Router {

    static let shared: Router = .init()
    private init() {}
    private (set) var window: UIWindow?

    func showRoot(window: UIWindow?) {
        let vc = UIStoryboard.shopListViewController
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav

        window?.makeKeyAndVisible()
        self.window = window
    }
}
