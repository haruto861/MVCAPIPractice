//
//  ShopListViewController.swift
//  MVCPractice
//
//  Created by 松島悠人 on 2021/08/26.
//

import UIKit

final class ShopListViewController: UIViewController {

    @IBOutlet private weak var shopListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        shopListTableView.delegate = self
        shopListTableView.dataSource = self
        shopListTableView.register(ShopListTableViewCell.nib(), forCellReuseIdentifier: ShopListTableViewCell.identifier)
    }
}

extension ShopListViewController: UITableViewDelegate {}

extension ShopListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopListTableViewCell.identifier) as! ShopListTableViewCell
        return cell
    }
}
