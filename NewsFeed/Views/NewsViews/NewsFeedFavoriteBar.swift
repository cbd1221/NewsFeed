//
//  NewsFeedFavoriteBar.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/30/22.
//

import SwiftUI
import WebKit

struct NewsFeedFavoriteBar: View {
    @State var newsItem: NewsItem
    @State var showActionSheet = false
    @State var favorited: Bool = false
    var body: some View {
            HStack {
                Button { showActionSheet = true } label: { Image(systemName: "chevron.up")}
                    .padding()
                Spacer()
                Image(systemName: favorited ? "heart.fill" : "heart")
                    .padding()
                    .foregroundColor(favorited ? .red : .cyan)
                    .onTapGesture(count: 2) {
                        self.favorite()
                    }
            }
            .onAppear {
                if NewsModel.shared.favoriteNews.contains(newsItem) {
                    self.favorited = true
                } else {
                    self.favorited = false
                }
            }
    }

    
    
    func favorite() {
        if self.favorited == false {
            self.favorited = true
            NewsModel.shared.addFavorite(item: newsItem)
            print("added \(newsItem) to favorites!")
        } else {
            self.favorited = !self.favorited
            if NewsModel.shared.favoriteNews.contains(newsItem) {
                if let index = NewsModel.shared.favoriteNews.firstIndex(of: newsItem) {
                    NewsModel.shared.favoriteNews.remove(at: index)
                }
            }
        }
    }
}

struct NewsFeedFavoriteBar_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedFavoriteBar(newsItem: NewsModel.defaultNewsItem)
    }
}
