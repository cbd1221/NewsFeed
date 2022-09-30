//
//  NewsFeedFavoriteBar.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/30/22.
//

import SwiftUI

struct NewsFeedFavoriteBar: View {
    var newsItem: NewsItem
    @State var favorited: Bool = false
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: favorited ? "heart.fill" : "heart")
                .foregroundColor(favorited ? .red : .cyan)
                .onTapGesture(count: 2) {
                    self.favorite()
                }
        }.onAppear {
            if !NewsModel.shared.favoriteNews.contains(newsItem) {
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

//struct NewsFeedFavoriteBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsFeedFavoriteBar()
//    }
//}
