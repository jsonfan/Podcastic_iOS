//
//  PodcasticViewController.swift
//  Podcastic
//
//  Created by Jason on 1/26/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import UIKit

class PodcasticViewController: UIViewController, DataBrokerRequestor, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func searchButtonPressed(sender: UIButton) {
        let broker = PodcastDataBroker(forRequestor: self)
        broker.GetPodcastSearchResultsWithTerm(searchTextField.text!)
        
        // dismiss keyboard
        searchTextField.resignFirstResponder()
    }
    
    @IBOutlet weak var podcastTableView: UITableView!
    
    var podcastArray: [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowEpisodes" {
            
            let episodesTableViewController = segue.destinationViewController as! EpisodeTableViewController
            
            if let selectedPodcastCell = sender as? UITableViewCell {
                
                let indexPath = podcastTableView.indexPathForCell(selectedPodcastCell)!
                let selectedPodcast: Podcast
                selectedPodcast = podcastArray[indexPath.row] as! Podcast
                
                episodesTableViewController.podcastToView = selectedPodcast
            }

        }
    }

    // MARK: - DataBrokerRequestor implementation

    func brokerRequestComplete(resultArray: Array<AnyObject>) {
        podcastArray = resultArray
        self.podcastTableView.reloadData()
    }
    
}

