//
//  NewsRequest.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/27/22.
//

import Foundation
import SwiftUI

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
