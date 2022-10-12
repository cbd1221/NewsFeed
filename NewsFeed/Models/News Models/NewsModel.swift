//
//  NewsModel.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/27/22.
//
import WebKit
import Foundation
import SwiftUI

class NewsModel: ObservableObject {
    static let shared = NewsModel()
    @Published var jobsLoaded: Bool
    @Published var busy: Bool
    @Published var newsLoaded: Bool
    private let bestStoriesString = "https://hacker-news.firebaseio.com/v0/beststories.json?pretty=print"
    private let jobsString = "https://hacker-news.firebaseio.com/v0/jobstories.json?pretty=print"
    var newsRequests: [NewsRequest]
    var jobRequests: [JobRequest]
    @Published var newsItems: [NewsItem]
    @Published var jobItems: [JobItem]
    @Published var favoriteNews: [NewsItem] = []
    @Published var favoriteJobs: [JobItem] = []
    var storyIds: [Int] = []
    var jobIds: [Int] = []
    
    init() {
        print("init shared datamodel")
        self.newsRequests = []
        self.jobRequests = []
        self.newsItems = []
        self.jobItems = []
        self.busy = false
        self.newsLoaded = false
        self.jobsLoaded = false
        Task {
            DispatchQueue.main.async {[weak self] in
                self?.busy = true
            }
            if let ids = await fetchIDArray(url: bestStoriesString) {
                storyIds = ids
                for (_, item) in storyIds.enumerated() {
                    newsRequests.append(NewsRequest(id: item))
                }
                for request in newsRequests {
                    if let item = request.requestNews() {
                        DispatchQueue.main.async {
                            self.newsItems.append(item)
                        }
                    }
                }
            }
            DispatchQueue.main.async {[weak self] in
				self?.filterNews()
                self?.busy = false
                self?.newsLoaded = true
            }
        }
        Task {
            DispatchQueue.main.async {[weak self] in
                self?.busy = true
            }
            if let jobItemIds = await fetchIDArray(url: jobsString) {
                jobIds = jobItemIds
                for (_, item) in jobIds.enumerated() {
                    self.jobRequests.append(JobRequest(id: item))
                }
                for request in jobRequests {
                    if let item = request.requestJobData() {
                        DispatchQueue.main.async {
                            self.jobItems.append(item)
                        }
                    }
                }
            }
            DispatchQueue.main.async {[weak self] in
                self?.busy = false
                self?.jobsLoaded = true
            }
        }
    }
    
    func filterNews() {
        let news = self.newsItems
        self.newsItems.removeAll()
        for newsItem in news {
            if newsItem.type == "story" {
                self.newsItems.append(newsItem)
            }
        }
    }
    
    func fetchIDArray(url: String) async -> [Int]? {
        let decoder = JSONDecoder()
        if let url = URL(string: url) {
            do {
                let data = try Data(contentsOf: url)
                let intData = try decoder.decode(Array<Int>.self, from: data)
                print(intData)
                return intData
            } catch {
                print("try block failed")
            }
        } else {
            print("Our url was bad")
        }
        print("returning nil")
        return nil
    }
    
    func addFavorite(item: JobItem) {
        favoriteJobs.append(item)
    }
    func addFavorite(item: NewsItem) {
        favoriteNews.append(item)
    }
    
}

extension NewsModel {
    public static let defaultNewsItem: NewsItem = NewsItem(by: "rakshasha", descendants: 13560, id: 1221, kids: nil, score: 100, text: "This is the text value of our default news item", time: 1001929481, title: "This is the title of a default news item", type: "story", url: "https://news.ycombinator.com")
}
