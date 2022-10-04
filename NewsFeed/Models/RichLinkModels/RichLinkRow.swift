//
//  RichLinkData.swift
//  NewsFeed
//
//  Created by Colin Dively on 9/28/22.
//

import LinkPresentation
import SwiftUI

func richLink(urlString: String, view: UIView) {
    let metadataProvider = LPMetadataProvider()
    let url = URL(string: urlString)!
    
    metadataProvider.startFetchingMetadata(for: url) { metadata, error in
        guard let metadata = metadata else { return }
        
        let linkView = LPLinkView(metadata: metadata)
        view.addSubview(linkView)
    }
}


struct RichLinkRow: UIViewRepresentable {
    var previewURL: URL
    
    func makeUIView(context: Context) -> LPLinkView {
        let view = LPLinkView()
        let provider = LPMetadataProvider()
        provider.startFetchingMetadata(for: previewURL) { (metadata, error) in
            if let md = metadata {
                DispatchQueue.main.async {
                    view.metadata = md
                }
            }
        }
        return view
    }
    func updateUIView(_ uiView: LPLinkView, context: Self.Context) {
    }
}

struct StringLink: Identifiable {
    var id = UUID()
    var string: String
}

struct RichView: View {
    var link: String
    
    var body: some View {
        RichLinkRow(previewURL: URL(string: link)!)
    }
}
