//
//  ShopListViewController.swift
//  MVCPractice
//
//  Created by 松島悠人 on 2021/08/26.
//

import UIKit

final class ShopListViewController: UIViewController {

    @IBOutlet private weak var shopListTableView: UITableView!

    private var shopList: [Shop] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        shopListTableView.delegate = self
        shopListTableView.dataSource = self
        shopListTableView.register(ShopListTableViewCell.nib(), forCellReuseIdentifier: ShopListTableViewCell.identifier)
   
        API.shared.getShopData { res in
            self.shopList = res.results.shop
            self.shopListTableView.reloadData()
        }
    }
}

extension ShopListViewController: UITableViewDelegate {}

extension ShopListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopListTableViewCell.identifier) as! ShopListTableViewCell
        cell.configure(shopName: self.shopList[indexPath.row].name, shopAccess: self.shopList[indexPath.row].address, shopImageUrl: self.shopList[indexPath.row].logoImage)
        return cell
    }
}
