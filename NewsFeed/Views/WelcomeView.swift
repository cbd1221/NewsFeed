//
//  WelcomeView.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/29/22.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var newsModel: NewsModel
    var body: some View {
        VStack {
            Text("Welcome To The NewsFeed")
                .font(.headline)
            Text("Options to the left and right host a variety of items, from jobs to articles")
                .padding()
                .font(.subheadline)
            if newsModel.busy == true {
            ProgressView()
            }
        }
    }
}

//struct WelcomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView()
//    }
//}
