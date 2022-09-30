//
//  JobCardView.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/29/22.
//

import SwiftUI

struct JobCardView: View {
    var job: JobItem
    var body: some View {
        VStack {
            JobView(job: job)
        }
        .padding()
        .border(.white, width: 1.0)
        .background(Color.cyan.opacity(0.1))
        .cornerRadius(18)
    }
}



//struct JobCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        JobCardView()
//    }
//}
