//
//  JobFeed.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/29/22.
//

import SwiftUI

struct JobFeed: View {
    @StateObject var newsModel: NewsModel = NewsModel.shared
    var body: some View {
        VStack {
            Text("Jobs")
                .font(.headline)
            Text("Available Jobs: \(newsModel.jobItems.count)")
            List {
                ForEach(newsModel.jobItems, id: \.self) { job in
                    Section(job.title ?? "title") {
                        JobView(job: job)
                    }
                }
            }
        }
    }
}

//struct JobFeed_Previews: PreviewProvider {
//    static var previews: some View {
//        JobFeed()
//    }
//}
