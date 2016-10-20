//
//  PhotoFetcher.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 5/6/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import Foundation

struct PhotoFetcher {
    let networking: Networking
    
    func fetch(response: [FlickrPhoto]? -> ()) {
        networking.request { data in
            let photos = data.map { self.decode($0) }
            response(photos)
        }
    }
    
    private func decode(data: NSData) -> [FlickrPhoto] {
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as? NSDictionary
            
            if let dictionary = object?.valueForKey("photos") as? [String:AnyObject], photos = dictionary["photo"] as? [[String:AnyObject]] {
                return photos.flatMap { FlickrPhoto(dictionary: $0) }
            }
            
        } catch {
            print(error)
        }
        
        return []
    }
    
}