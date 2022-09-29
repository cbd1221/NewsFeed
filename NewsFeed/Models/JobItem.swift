//
//  JobsData.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/29/22.
//

import Foundation

struct JobItem: Identifiable, Codable, Hashable {
    var by: String?
    var id: Int
    var score: Int?
    var text: String?
    var time: Int
    var title: String?
    var type: String?
    var url: String?
}

struct JobRequest: Identifiable, Codable {
    var id: Int
    var uniqueURL: String {
        "https://hacker-news.firebaseio.com/v0/item/\(id).json?print=pretty"
    }
    
    func requestJobData() -> JobItem? {
        let decoder = JSONDecoder()
        let urlString = self.uniqueURL
        if let url = URL(string: urlString) {
            do {
                let data = try Data(contentsOf: url)
                let newsItem = try decoder.decode(JobItem.self, from: data)
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
