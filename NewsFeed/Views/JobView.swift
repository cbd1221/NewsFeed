//
//  JobView.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/29/22.
//

import SwiftUI

struct JobView: View {
    var job: JobItem
    @State var expanded = false
    var body: some View {
        LazyVStack {
            Text(job.title ?? "")
                .font(.headline)
                .onTapGesture {
                    withAnimation {
                        self.expanded = !expanded
                    }
                }
            if (expanded) {
                Text(job.text ?? "")
                    .lineLimit(3)
                RichView(link: job.url ?? "https://news.ycombinator.com")
            }
        }.onDisappear {
            self.expanded = false
        }
    }
}

//struct JobView_Previews: PreviewProvider {
//    static var previews: some View {
//        JobView()
//    }
//}
