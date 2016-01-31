//
//  Podcast.swift
//  Podcastic
//
//  Created by Jason on 1/26/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation

class Podcast : PodcasticModel {
    
    var artistName: String = ""
    var collectionName: String = ""
    var feedUrl: String = ""
    var artworkUrl600: String = ""
    var genreIds: [String] = []
    var genres: [String] = []
    
    
    override func initFromProperties(propertiesDictionary: NSDictionary) {
        artistName = propertiesDictionary["artistName"] as! String
        collectionName = propertiesDictionary["collectionName"] as! String
        feedUrl = propertiesDictionary["feedUrl"] as! String
        genreIds = propertiesDictionary["genreIds"] as! [String]
        artworkUrl600 = propertiesDictionary["artworkUrl600"] as! String
    }
}