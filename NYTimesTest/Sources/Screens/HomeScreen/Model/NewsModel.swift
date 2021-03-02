//
//  NewsModel.swift
//  NYTimesTest
//
//  Created by Andrew Kolbasov on 25.02.2021.
//

import Foundation

struct NewsFeedsModel: Decodable {
    let all: [Information]
    
    enum CodingKeys: String, CodingKey {
        case all = "results"
    }
}

struct Information: Decodable {
    let title: String?
    let abstract: String?
    let byline: String?
    let multimedia : [Multimedia]?
}

struct Multimedia: Decodable {
    let url: String?
}
