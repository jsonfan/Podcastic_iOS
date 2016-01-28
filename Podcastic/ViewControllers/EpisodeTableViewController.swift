//
//  EpisodeTableViewController.swift
//  Podcastic
//
//  Created by Jason on 1/28/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import UIKit

class EpisodeTableViewController: UITableViewController, DataBrokerRequestor {
    
    var podcastToView: Podcast?
    
    var episodeArray: [AnyObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let broker = EpisodeDataBroker(forRequestor: self)
        broker.GetEpisodesWithAFeedURL((podcastToView?.feedUrl)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return episodeArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: EpisodeTableCell = tableView.dequeueReusableCellWithIdentifier("episodeTableCellID")! as! EpisodeTableCell
        cell.model = episodeArray[indexPath.row] as? Episode
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: EpisodeTableCell = tableView.dequeueReusableCellWithIdentifier("episodeTableCellID")! as! EpisodeTableCell
        cell.model = episodeArray[indexPath.row] as? Episode
        UIApplication.sharedApplication().openURL(NSURL(string: (cell.model?.enclosureURL)!)!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - DataBrokerRequestor implementation
    
    func brokerRequestComplete(resultArray: Array<AnyObject>) {
        episodeArray = resultArray
        tableView.reloadData()
    }

}
