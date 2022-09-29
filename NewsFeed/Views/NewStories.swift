//
//  MyApp.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/27/22.
//

import SwiftUI

struct NewStories: View {
    @EnvironmentObject var newsModel: NewsModel
    var body: some View {
        VStack {
            Text("News: \(newsModel.newsRequests.count) Articles")
                .font(.headline)
            Spacer()
            List {
                ForEach(newsModel.newsItems, id: \.self) { newsItem in
                    Section {
                        NewsView(newsItem: newsItem)
                            .padding()
                    }
                }
            }.listStyle(.insetGrouped)
        }
    }
}


struct MyApp_Previews: PreviewProvider {
    static var previews: some View {
        NewStories()
    }
}

//                Section("Story IDS") {
//                    ForEach(newsModel.storyIds, id: \.self) {
//                        Text("Story Id: \($0)")
//                    }
//                }
