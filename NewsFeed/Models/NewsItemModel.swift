//
//  NewsItemModel.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/29/22.
//

import Foundation

struct NewsItem: Identifiable, Hashable, Codable {
    var by: String?
    var descendants: Int?
    var id: Int?
    var kids: [Int]?
    var score: Int?
    var text: String?
    var time: Int?
    var title: String?
    var type: String?
    var url: String?
}
