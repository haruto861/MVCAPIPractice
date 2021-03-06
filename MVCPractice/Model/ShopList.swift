//
//  ShopList.swift
//  MVCPractice
//
//  Created by 松島悠人 on 2021/08/29.
//

import Foundation


struct ResultsWrapData: Codable {
    let results: ResultsData
}

struct ResultsData: Codable {
    let shop: [Shop]
}

struct Shop: Codable {
    let address: String
    let name: String
    let logoImage: String
    let genre: Genre
    let urls: Urls


    enum CodingKeys: String, CodingKey {
        case address = "address"
        case name = "name"
        case logoImage = "logo_image"
        case genre = "genre"
        case urls = "urls"
    }
}

struct Genre: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct Urls: Codable {
    let pc: String

    enum CodingKeys: String, CodingKey {
        case pc = "pc"
    }
}
