//
//  Network.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 5/6/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import Foundation

struct Network: Networking {
    
    func request(response: NSData? -> ()) {
        let request = NSMutableURLRequest(URL: NSURL(string: FlickrAPI.queryString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)!)
        request.HTTPMethod = "GET"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, _, _ in response(data) }
        task.resume()
    }

}