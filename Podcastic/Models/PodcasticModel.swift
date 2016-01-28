//
//  PodcasticModel.swift
//  Podcastic
//
//  Created by Jason on 1/27/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation

class PodcasticModel: NSObject {
    var collectionID: Int = 0
    
    func initFromProperties(propertiesDictionary: NSDictionary) {
        collectionID = propertiesDictionary["collectionID"] as! Int
    }
}