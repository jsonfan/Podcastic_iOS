//
//  Episode.swift
//  Podcastic
//
//  Created by Jason on 1/27/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation

class Episode : PodcasticModel {
    
    var title: String = ""
    var pubDate: String = ""
    var duration: String = ""
    var summary: String = ""
    var enclosureURL: String = ""
    
    override func initFromProperties(propertiesDictionary: NSDictionary) {
        title = propertiesDictionary["title"] as! String
        pubDate = propertiesDictionary["pubDate"] as! String
        duration = propertiesDictionary["itunes:duration"] as! String
        enclosureURL = propertiesDictionary["enclosureURL"] as! String
    }
    
    // MARK: - Middleware inits
    //    override func initFromProperties(propertiesDictionary: NSDictionary) {
    //        title = propertiesDictionary["title"]![0] as! String
    //        pubDate = propertiesDictionary["pubDate"]![0] as! String
    //        duration = propertiesDictionary["itunes:duration"]![0] as! String
    ////        summary = propertiesDictionary["itunes:summary"]![0] as! String
    //        enclosureURL = propertiesDictionary["enclosure"]![0]["$"]!!["url"] as! String
    //    }
}