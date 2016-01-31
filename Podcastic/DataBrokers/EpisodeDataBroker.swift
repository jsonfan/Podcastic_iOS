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
    
//    override func fetchDataAt(aURI: String) {
//        var resultArray: Array<AnyObject> = []
//        
//        Alamofire.request(.GET, aURI).responseJSON { response in
//            
//            var tempResult = response.result.value as! Dictionary<String, AnyObject>
//            let tempArray = tempResult["resultArray"] as! Array<Dictionary<String, AnyObject>>
//            
//            // We now know we have an array of JSON objects
//            for dataDict: Dictionary<String, AnyObject> in tempArray {
//                resultArray.append(self.createModelFrom(dataDict)!)
//            }
//            
//            self.requestor.brokerRequestComplete(resultArray)
//        }
//    }
    
    override func fetchDataAt(aURI: String) {
        var resultArray: Array<AnyObject> = []
        
        Alamofire.request(.GET, aURI, parameters: nil)
            .response { (request, response, data, error) in
                
                let xml = SWXMLHash.parse(data!)

                for elem in xml["rss"]["channel"]["item"] {
                      let dataDict = ["title": elem["title"].element!.text!,
                                      "pubDate": elem["pubDate"].element!.text!,
                                      "itunes:duration": elem["itunes:duration"].element!.text!,
                                      "enclosureURL" : elem["enclosure"].element!.attributes["url"]!
                                      ]
                    resultArray.append(self.createModelFrom(dataDict)!)
                }
                self.requestor.brokerRequestComplete(resultArray)
        }
    }
    
    override func createModelFrom(dataDictionary: NSDictionary) -> Episode? {
        let modelObj = Episode()
        
        modelObj.initFromProperties(dataDictionary)

        return modelObj
    }
    
    func GetEpisodesWithAFeedURL(aURL: String) {
        fetchDataAt(aURL)
        
        // middleware call
//        fetchDataAt("http://localhost:3000/".stringByAppendingString(aURL))
    }
    
    
}