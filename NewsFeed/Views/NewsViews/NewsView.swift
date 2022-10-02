//
//  NewsView.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/28/22.
//
import WebKit
import SwiftUI
import Foundation

struct NewsView: View {
    var newsItem: NewsItem
    @State var expanded = false
    var body: some View {
        LazyVStack {
            Text(newsItem.title ?? "")
                .font(.headline)
                .onTapGesture {
                    withAnimation {
                        self.expanded = !expanded
                    }
                }
            if (expanded) {
                RichView(link: newsItem.url ?? "https://news.ycombinator.com")
                    .fixedSize()
            }
        }.background(in: RoundedRectangle(cornerRadius: 10.0))
    }
}

//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsView(newsItem: NewsModel.shared.newsItems[0])
//            .environmentObject(NewsModel.shared)
//    }
//}
