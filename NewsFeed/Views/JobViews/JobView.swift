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
                Text("posted: " + (job.by ?? "anonymous"))
                    .font(.caption)
                RichView(link: job.url ?? "https://news.ycombinator.com")
            }
        }.onDisappear {
            self.expanded = false
        }
    }
}

struct JobView_Previews: PreviewProvider {
    var jobItemPreview = JobItem(id: 1, text: "Job descriptions go here and we just need to format them", time: 900, title: "This is the job Title")
    
    static var previews: some View {
        JobView(job: JobItem(id: 1, text: "Job descriptions go here and we just need to format them", time: 900, title: "This is the job Title"))
        //preview 2
//        JobCard()
//            .padding()
//            .border(.white, width: 1.0)
//            .background(Color.cyan.opacity(0.1))
//            .cornerRadius(18)
    }
}

