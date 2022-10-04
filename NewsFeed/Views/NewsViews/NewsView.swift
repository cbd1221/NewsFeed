//
//  NewsView.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/28/22.
//
import SwiftUI
import Foundation

struct NewsView: View {
    @EnvironmentObject var newsModel: NewsModel
    var richView: RichView
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
                richView
            }
        }.animation(.easeIn, value: expanded)
            .background(in: RoundedRectangle(cornerRadius: 10.0))
    }
}

//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsView(newsItem: NewsModel.defaultNewsItem)
//            .environmentObject(NewsModel.shared)
//    }
//}
//

