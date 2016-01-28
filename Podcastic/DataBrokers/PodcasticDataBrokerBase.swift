//
//  PodcastDataBrokerBase.swift
//  Podcastic
//
//  Created by Jason on 1/26/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation
import Alamofire

protocol DataBrokerRequestor {
    func brokerRequestComplete(resultArray: Array<AnyObject>)
    func brokerRequestFailed(error: NSError)
}

//  Add a default implementation of failed request to make it optional for requestors
extension DataBrokerRequestor {
    func brokerRequestFailed(error: NSError) {
        
    }
}


class PodcasticDataBrokerBase: NSObject {
    
    let requestor: DataBrokerRequestor
    
    init(forRequestor: DataBrokerRequestor){
        requestor = forRequestor
    }
    
    func fetchDataAt(aURI: String) {
        var resultArray: Array<AnyObject> = []
        
        Alamofire.request(.GET, aURI).responseJSON { response in
            
            var tempResult = response.result.value as! Dictionary<String, AnyObject>
            let tempArray = tempResult["resultArray"] as! Array<Dictionary<String, AnyObject>>
            
            // We now know we have an array of JSON objects
            for dataDict: Dictionary<String, AnyObject> in tempArray {
                resultArray.append(self.createModelFrom(dataDict)!)
            }
            
            self.requestor.brokerRequestComplete(resultArray)
        }
    }
    
    func createModelFrom(dataDictionary: NSDictionary) -> PodcasticModel? {
        return nil
    }
    
}