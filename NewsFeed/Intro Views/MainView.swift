//
//  MainView.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/29/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var newsModel: NewsModel
    @State private var selectedTab = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            NewStories().environmentObject(newsModel)
                .tabItem {
                    Label("News", systemImage: "newspaper.fill")
                }
                .tag(0)
            WelcomeView().environmentObject(newsModel)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(1)
            JobFeed().environmentObject(newsModel)
                .tabItem {
                    Label("Jobs", systemImage: "wrench.fill")
                }
                .tag(2)
            FavoritesView().environmentObject(newsModel)
                .tabItem {
                    Label("Favorites", systemImage: "heart.circle")
                }
                .tag(3)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
