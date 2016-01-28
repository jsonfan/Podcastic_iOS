//
//  EpisodeDataBrokerBase.swift
//  Podcastic
//
//  Created by Jason on 1/27/16.
//  Copyright © 2016 Jason. All rights reserved.
//

//import Foundation
//import Alamofire
//
//class EpisodeDataBrokerBase: PodcasticDataBrokerBase {
//    
//    let requestor: DataBrokerRequestor
//
//    init(forRequestor: DataBrokerRequestor){
//        requestor = forRequestor
//    }
//    
//    func fetchDataAt(aURI: String) {
//        var resultArray: Array<AnyObject> = []
//        
//        Alamofire.request(.GET, "http://localhost:3000/".stringByAppendingString(aURI)).responseJSON { response in
////            print(response.request)  // original URL request
////            print(response.response) // URL response
////            print(response.data)     // server data
////            print(response.result)   // result of response serialization
////            
//            var tempResult = response.result.value as! Dictionary<String, AnyObject>
//            let tempArray = tempResult["resultArray"] as! Array<Dictionary<String, AnyObject>>
//            
//            // We now know we have an array of JSON objects
//            for dataDict: Dictionary<String, AnyObject> in tempArray {
//                resultArray.append(self.createModelFrom(dataDict)!)
////                print(dataDict)
//            }
//            
//            var i = 0
//            
//            self.requestor.brokerRequestComplete(resultArray)
//        }
//        
//    }
//    
//    
//    override func createModelFrom(dataDictionary: NSDictionary) -> EpisodeModel? {
//        return nil
//    }
//    
//
//    
//}