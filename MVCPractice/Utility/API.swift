//
//  API.swift
//  MVCPractice
//
//  Created by 松島悠人 on 2021/08/26.
//

import Foundation
import Alamofire

final class API {

    static let shared: API = .init()
    private init() {}

    func getAPI() {
        AF.request("https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(Env["HOTPEPPER_KEY"] ?? "")&format=json&large_area=Z011").response { response in
            do {
                guard let data = response.data else {
                    return
                }
                let shopList = try JSONDecoder().decode(ResultsWrapData.self, from: data)
                print("json:", shopList) 
            }
            catch(let error) {
                print("取得エラー",error)
            }
        }
    }
}
