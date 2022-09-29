//
//  NewsFeedApp.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/27/22.
//

import SwiftUI

@main
struct NewsFeedApp: App {
    @StateObject var newsModel = NewsModel.shared
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(newsModel)
        }
    }
}
