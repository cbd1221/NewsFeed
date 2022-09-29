//
//  NewsModel.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/27/22.
//

import Foundation
import SwiftUI

class NewsModel: ObservableObject {
    @Published var busy: Bool
    private let bestStoriesString = "https://hacker-news.firebaseio.com/v0/beststories.json?pretty=print"
    private let jobsString = "https://hacker-news.firebaseio.com/v0/jobstories.json?pretty=print"
    static let shared = NewsModel()
    var newsRequests: [NewsRequest]
    var jobRequests: [JobRequest]
    var newsItems: [NewsItem]
    var jobItems: [JobItem]
    var storyIds: [Int] = []
    var jobIds: [Int] = []
    
    init() {
        print("init shared datamodel")
        self.newsRequests = []
        self.jobRequests = []
        self.newsItems = []
        self.jobItems = []
        self.busy = false
        do {
            busy = true
            if let ids = self.fetchIDArray(url: self.bestStoriesString) {
                self.storyIds = ids
                for (_, item) in storyIds.enumerated() {
                    self.newsRequests.append(NewsRequest(id: item))
                }
                for request in newsRequests {
                    if let item = request.requestNews() {
                        self.newsItems.append(item)
                    }
                }
            }
            //filter NewsItems
            filterNews()
            //fetch jobs
            if let jobIds = self.fetchIDArray(url: jobsString) {
                self.jobIds = jobIds
                for (_, item) in jobIds.enumerated() {
                    self.jobRequests.append(JobRequest(id: item))
                }
                for request in jobRequests {
                    if let item = request.requestJobData() {
                        self.jobItems.append(item)
                    }
                }
            }
            busy = false
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
    
    func filterJobs() {
        let jobs = self.jobItems
        self.jobItems.removeAll()
        for job in jobs {
            if job.type == "job" {
                self.jobItems.append(job)
            }
        }
    }
    
    
    public func fetchIDArray(url: String) -> [Int]? {
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

}


struct Stories: Codable {
    var ids: [Int]
    
}

