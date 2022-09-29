//
//  NewsItemView.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/27/22.
//

import SwiftUI
import Foundation

struct NewsItemView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "note.text")
                    .aspectRatio(contentMode: .fill)
                VStack {
                    Text("This is the Headline")
                    Text("Author Name")
                }
            }
        }
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemView()
    }
}
