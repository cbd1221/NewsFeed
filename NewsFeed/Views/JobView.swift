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
            Text(job.title ?? "job title")
                .font(.subheadline)
                .onTapGesture {
                    withAnimation {
                        self.expanded = !expanded
                    }
                }
            if (expanded) {
                Text(job.text ?? "job text")
                RichView(link: job.url ?? "no link available")
            }
        }
    }
}

//struct JobView_Previews: PreviewProvider {
//    static var previews: some View {
//        JobView()
//    }
//}
