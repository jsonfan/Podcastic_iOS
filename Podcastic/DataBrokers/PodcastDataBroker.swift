//
//  PodcastDataBroker.swift
//  Podcastic
//
//  Created by Jason on 1/26/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation

class PodcastDataBroker: PodcasticDataBrokerBase {
    
    override var description: String {
        return "I am a Podcast Data Broker"
    }
    
    override func createModelFrom(dataDictionary: NSDictionary) -> Podcast? {
        let modelObj = Podcast()
        
        modelObj.initFromProperties(dataDictionary)
        
        return modelObj
    }
    
    func GetPodcastSearchResultsWithTerm(aTerm: String) {
        
        let aTermWithHandledWhiteSpace = aTerm.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        fetchDataAt(String(format: iTunesSettingsAdapter.GetSearchPodcastsEndPoint(), aTermWithHandledWhiteSpace))
        
        // use below if running middleware on local host
//        fetchDataAt("http://localhost:3000/api/".stringByAppendingString(aTermWithHandledWhiteSpace))
    }
}