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
        VStack(alignment: .center, spacing: 20) {
            Text("Welcome To The NewsFeed")
                .font(.headline)
                .fontWeight(.bold)
                
            Image(systemName: "newspaper.fill")
                .foregroundColor(.cyan)
                .scaleEffect(2.5)
                .padding()
                .font(.subheadline)
                
            VStack {
                if newsModel.busy == true {
                    ProgressView()
                        .animation(.default, value: newsModel.newsLoaded)
                        .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
                        .scaleEffect(1.5)
                }
            }
        }.navigationTitle(Text("Welcome To The NewsFeed"))
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(NewsModel.shared)
    }
}
