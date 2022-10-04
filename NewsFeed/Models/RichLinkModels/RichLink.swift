//
//  MetadataModel.swift
//  NewsFeed
//
//  Created by Colin Dively on 10/3/22.
//

import Foundation
import LinkPresentation
import UIKit

class LinkData: NSObject, NSSecureCoding, Identifiable {
    static var supportsSecureCoding = true
    var id: Int?
    var metadata: LPLinkMetadata?
    
    func encode(with coder: NSCoder) {
        //check for properties
        guard let id = id else { return }
        guard let metadata = metadata else { return }
        //serialize properties of class
        coder.encode(NSNumber(integerLiteral: id), forKey: "id")
        coder.encode(metadata as NSObject, forKey: "metadata")
    }
    
    required init?(coder: NSCoder) {
        //deserialize properties and assign to associated class properties
        id = coder.decodeObject(of: NSNumber.self, forKey: "id")?.intValue
        metadata = coder.decodeObject(of: LPLinkMetadata.self, forKey: "metadata")
    }
    
    override init() {
        super.init()
    }
    
}
