//
//  ShopListViewController.swift
//  MVCPractice
//
//  Created by 松島悠人 on 2021/08/26.
//

import UIKit

final class ShopListViewController: UIViewController {

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var shopListTableView: UITableView!

    private var shopList: [Shop] = [] {
        didSet {
            shopListTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        shopListTableView.delegate = self
        shopListTableView.dataSource = self
        searchBar.delegate = self
        shopListTableView.register(ShopListTableViewCell.nib(), forCellReuseIdentifier: ShopListTableViewCell.identifier)
    }
}

extension ShopListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication.shared.open( NSURL(string: self.shopList[indexPath.row].urls.pc)! as URL, options: [:], completionHandler: nil)
    }
}

extension ShopListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopListTableViewCell.identifier) as! ShopListTableViewCell

        if shopList.count > 0 {
            DispatchQueue.global().async {
                do {
                    let imgData = try Data(contentsOf: URL(string: self.shopList[indexPath.row].logoImage)!)
                    DispatchQueue.main.async {
                        cell.configure(
                            shopName: ("\(self.shopList[indexPath.row].genre.name) /" + " \(self.shopList[indexPath.row].name)" ),
                            shopAccess: self.shopList[indexPath.row].address,
                            shopImageData: imgData
                        )
                    }
                } catch let err {
                    print("Error : \(err.localizedDescription)")
                }
            }
        }
        return cell
    }
}

extension ShopListViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        API.shared.getShopData { res in
            self.shopList = res.results.shop.filter({$0.name.contains(searchBar.text ?? "") || $0.genre.name.contains(searchBar.text ?? "")}  )
        }
    }
}
