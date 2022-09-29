//
//  NewsView.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/28/22.
//

import SwiftUI

struct NewsView: View {
    @State var newsModel = NewsModel.shared
    var newsItem: NewsItem
    @State var expanded = false
    var body: some View {
        LazyVStack {
            Text(newsItem.title ?? "News Title")
                .font(.headline)
                .onTapGesture {
                    withAnimation {
                        self.expanded = !expanded
                    }
                }
            if (expanded) {
                RichView(link: newsItem.url!)
            }
        }
    }
}

//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
////        NewsView(newsItem: NewsItem(id: 1, text: "How are you", title: "Helllo Kyli"))
//    }
//}
