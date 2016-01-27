//
//  PodcastModel.swift
//  Podcastic
//
//  Created by Jason on 1/26/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation

class PodcastModel: NSObject {
    var collectionID: Int = 0
    
    func initFromProperties(propertiesDictionary: NSDictionary) {
        collectionID = propertiesDictionary["collectionID"] as! Int
    }
}
