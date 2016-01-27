//
//  PodcasticViewController.swift
//  Podcastic
//
//  Created by Jason on 1/26/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import UIKit

class PodcasticViewController: UIViewController, DataBrokerRequestor, UITableViewDataSource, UITableViewDelegate, MWFeedParserDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func searchButtonPressed(sender: UIButton) {
        let broker = PodcastDataBroker(forRequestor: self)
        broker.GetPodcastSearchResultsWithTerm(searchTextField.text!)
    }
    
    @IBOutlet weak var podcastTableView: UITableView!
    
    var podcastArray: [AnyObject] = []
    
    var feedItems = [MWFeedItem]()
    
    func request(){
        let url = NSURL(string: "http://feeds.serialpodcast.org/serialpodcast")
        let feedParser = MWFeedParser(feedURL: url)
        feedParser.connectionType = ConnectionTypeAsynchronously
        feedParser.delegate = self
        feedParser.parse()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate/DataSource implementation
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return podcastArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: PodcastTableCell = tableView.dequeueReusableCellWithIdentifier("podcastTableCellID")! as! PodcastTableCell
        cell.model = podcastArray[indexPath.row] as? Podcast
        return cell
    }

    // MARK: - DataBrokerRequestor implementation

    func brokerRequestComplete(resultArray: Array<AnyObject>) {
        podcastArray = resultArray
        self.podcastTableView.reloadData()
    }
    
    // MARK: - FEED PARSER DELEGATE
    
    func feedParserDidStart(parser: MWFeedParser!) {
        feedItems = [MWFeedItem]()
    }
    
    func feedParserDidFinish(parser: MWFeedParser!) {
        var i = 0
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedInfo info: MWFeedInfo!) {
        print(info)
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedItem item: MWFeedItem!) {
        feedItems.append(item)
    }

}

