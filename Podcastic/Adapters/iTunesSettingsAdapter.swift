//
//  iTunesSettingsAdapter.swift
//  Podcastic
//
//  Created by Jason on 1/26/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation

class iTunesSettingsAdapter {
    
    class func SettingsData() -> NSDictionary {
        let path = NSBundle.mainBundle().pathForResource("iTunes-Settings", ofType: "plist")
        return NSDictionary(contentsOfFile: path!)!
    }
    
    class func GetURIData() -> NSDictionary {
        return SettingsData().objectForKey("URIs") as! NSDictionary
    }
    
    class func GetiTunesSearchAPIBase() -> String {
        return GetURIData().objectForKey("iTunesSearchAPIBase") as! String
    }
    
    class func GetPodcastParameterValue() -> String {
        return GetURIData().objectForKey("SearchPodcasts") as! String
    }
    
    class func GetSearchCountryStoreFrontValue() -> String {
        return GetURIData().objectForKey("SearchCountryStoreFront") as! String
    }
    
    class func GetSearchResultsLimitValue() -> String {
        return GetURIData().objectForKey("SearchResultsLimit") as! String
    }
    
    class func GetSearchTermValue() -> String {
        return GetURIData().objectForKey("SearchTerm") as! String
    }
    
    class func GetSearchPodcastsEndPoint() -> String {
        return GetiTunesSearchAPIBase().stringByAppendingString(GetSearchResultsLimitValue())
            .stringByAppendingString(GetSearchTermValue())
    }
}