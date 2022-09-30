//
//  JobFeed.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/29/22.
//

import SwiftUI

struct JobFeed: View {
    @EnvironmentObject var newsModel: NewsModel
    var body: some View {
        VStack {
            Text("Jobs")
                .font(.headline)
            Text("Available Jobs: \(newsModel.jobItems.count)")
            List {
                ForEach(newsModel.jobItems, id: \.self) { job in
                    Section {
                        JobCardView(job: job)
                        JobFavoriteBar(job: job)
                    }
                }
            }.listStyle(.grouped)
        }
    }
}

struct JobFavoriteBar: View {
    var job: JobItem
    @State var favorited: Bool = false
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: favorited ? "heart.fill" : "heart")
                .foregroundColor(favorited ? .red : .cyan)
                .onTapGesture(count: 2) {
                    self.favorite()
                }
        }
    }
    func favorite() {
        if self.favorited == false {
            self.favorited = true
            NewsModel.shared.addFavorite(item: job)
            print("added \(job) to favorites")
        } else {
            self.favorited = !self.favorited
            if NewsModel.shared.favoriteJobs.contains(job) {
                if let index = NewsModel.shared.favoriteJobs.firstIndex(of: job) {
                    NewsModel.shared.favoriteJobs.remove(at: index)
                }
            }
        }
        
    }
}


struct JobFeed_Previews: PreviewProvider {
    static var previews: some View {
        JobFeed().environmentObject(NewsModel.shared)
    }
}
