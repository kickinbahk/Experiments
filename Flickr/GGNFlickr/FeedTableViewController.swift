//
//  FeedTableViewController.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 4/14/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    let feedCellID = "feedCell"
    let showPhotoSegue = "showPhoto"
    var model = [FlickrPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl?.addTarget(self, action: #selector(refreshFeed), forControlEvents: .ValueChanged)
        refreshControl?.beginRefreshing()
        
        refreshFeed()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == showPhotoSegue {
            if let vc = segue.destinationViewController as? DetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    vc.image = model[indexPath.row].image
                }
            }
        }
    }
    
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: FeedTableViewCell
        cell = tableView.dequeueReusableCellWithIdentifier(feedCellID) as? FeedTableViewCell ?? FeedTableViewCell()
        cell.feedImageView.image = model[indexPath.row].image
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return view.frame.width
    }
    
}

// MARK: - Networking
extension FeedTableViewController {
    
    func refreshFeed() {
        if !model.isEmpty { model.removeAll() }
        PhotoFetcher(networking: Network()).fetch { photos in
            photos?.forEach { self.model.append($0) }
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
        }
    }
}


















