//
//  NewsItemModel.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/29/22.
//
import LinkPresentation
import Foundation
import SwiftUI

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

//for each NewsItem we need to fetch, cache, and ultimately retreive the metadata while also loading a UIImage asynchronously on a background thread
//xcode constantly throws a single SIGTERM thread warning at the first line of NewsFeedApp.swift - tagging the @main as the source of the function that should not be called on main

