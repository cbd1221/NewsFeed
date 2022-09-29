//
//  NewsData.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/27/22.
//

import Foundation
import SwiftUI

struct NewsData: Identifiable, Hashable {
    var id: Int
    var deleted: Bool
    var type: String
    var by: String
    var time: Int
    var dead: Bool
    var kids: [Int]
    var descendants: Int
    var score: Int
    var title: String
    var url: String
}

struct NewsRequest: Identifiable, Codable {
    var id: Int
    var uniqueURL: String {
        "https://hacker-news.firebaseio.com/v0/item/\(id).json?print=pretty"
    }
    
    func requestNews() -> NewsItem? {
        let decoder = JSONDecoder()
        let urlString = self.uniqueURL
        if let url = URL(string: urlString) {
            do {
                let data = try Data(contentsOf: url)
                let newsItem = try decoder.decode(NewsItem.self, from: data)
                return newsItem
            } catch {
                print("error with data")
            }
        } else {
            print("error with URL")
        }
        return nil
    }
}

//struct NewsItem: Identifiable,Hashable, Codable {
//    var id: Int
//    var title: String
//    var url: String
//}

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
