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
                        JobView(job: job)
                            .padding()
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
