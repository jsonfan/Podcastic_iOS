//
//  EpisodeDataBroker.swift
//  Podcastic
//
//  Created by Jason on 1/27/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation
import Alamofire

class EpisodeDataBroker: PodcasticDataBrokerBase {
    
    override var description: String {
        return "I am an Episode Data Broker"
    }
    
    override func createModelFrom(dataDictionary: NSDictionary) -> Episode? {
        let modelObj = Episode()
        
        modelObj.initFromProperties(dataDictionary)

        return modelObj
    }
    
    func GetEpisodesWithAFeedURL(aURL: String) {
        fetchDataAt("http://localhost:3000/".stringByAppendingString(aURL))
    }
    
    
}