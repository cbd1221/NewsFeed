//
//  RickLinkModel.swift
//  NewsFeed
//
//  Created by Colin Dively on 10/3/22.
//
import LinkPresentation
import Foundation


class ArchivedDataModel: ObservableObject {
    static let shared = ArchivedDataModel()
    @Published var metadataDB: [LinkData] = []
    @Published var newsDB: [NewsItem] = []
    @Published var jobsDB: [JobItem] = []
    @Published var recentIDArrary: [Int] = []
    
    
    public func createLinkData(metadata: LPLinkMetadata, id: Int?) {
        guard let id = id else { return }
        let linkdata = LinkData()
        linkdata.id = id
        linkdata.metadata = metadata
        metadataDB.append(linkdata)
        archiveMetadata()
    }
    
    fileprivate func archiveMetadata() {
        //archive our metadata on the disk - we want to make this as efficient as possible. Check our cache on init and replace any unused links with the new articles/jobs?
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: metadataDB, requiringSecureCoding: true)
            guard let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
            try data.write(to: dirPath.appendingPathExtension("linksDB"))
            print(dirPath.appendingPathComponent("linksDB"))
        } catch {
            print(error.localizedDescription)
        }
    }
}
