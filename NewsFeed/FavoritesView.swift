//
//  FavoritesView.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/30/22.
//

import SwiftUI


struct FavoritesView: View {
    @EnvironmentObject var newsModel: NewsModel
    var body: some View {
            TabView {
                NewsFavoritesList()
                JobsFavoritesList()
            }
            .tabViewStyle(PageTabViewStyle())
    }
}


struct NewsFavoritesList: View {
    @EnvironmentObject var newsModel: NewsModel
    var body: some View {
        VStack {
            HStack() {
                Spacer()
                EditButton()
                    .padding(.horizontal)
            }
            List {
                ForEach(newsModel.favoriteNews, id: \.self) { newsItem in
                    Section {
                        NewsView(newsItem: newsItem)
                            .padding()
                    }
                }.onDelete(perform: delete)
            }
            .listStyle(.grouped)
        }
    }
    
    func delete(at offsets: IndexSet) {
        newsModel.favoriteNews.remove(atOffsets: offsets)
    }
    
    
    func unfavorite(item: NewsItem) {
        if NewsModel.shared.favoriteNews.contains(item) {
            if let index = NewsModel.shared.favoriteNews.firstIndex(of: item) {
                NewsModel.shared.favoriteNews.remove(at: index)
            }
        }
        
    }
}

struct JobsFavoritesList: View {
    @EnvironmentObject var newsModel: NewsModel
    var body: some View {
        VStack {
            HStack() {
                Spacer()
                EditButton()
                    .padding(.horizontal)
            }
            List {
                ForEach(newsModel.favoriteJobs, id: \.self) { job in
                    Section {
                        JobCardView(job: job)
                            .padding()
                    }
                }.onDelete(perform: delete)
            }.listStyle(.grouped)
        }
    }
    
    func delete(at offsets: IndexSet) {
        newsModel.favoriteJobs.remove(atOffsets: offsets)
    }
    
    //    func unfavorite(item: JobItem) {
    //        if NewsModel.shared.favoriteJobs.contains(item) {
    //            if let index = NewsModel.shared.favoriteJobs.firstIndex(of: item) {
    //                NewsModel.shared.favoriteJobs.remove(at: index)
    //            }
    //        }
    //    }
}




struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environmentObject(NewsModel.shared)
    }
}
