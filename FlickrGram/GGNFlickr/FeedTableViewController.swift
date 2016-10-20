//
//  FeedTableViewController.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 4/14/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    let reuseID = "cell"
    let showPhotoSegue = "showPhoto"
    var model = [FlickrPhotoType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GGNFlickrGram"
        tableView.registerClass(FlickrPhotoTableViewCell.self, forCellReuseIdentifier: reuseID)
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.showsVerticalScrollIndicator = false
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshFeed), forControlEvents: .ValueChanged)
        refreshControl?.beginRefreshing()
        refreshFeed()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseID) as! FlickrPhotoTableViewCell
        cell.configureCellWith(model[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.imageView.image = model[indexPath.row].image
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

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


















