//
//  FlickrPhoto.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 4/14/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import Foundation
import UIKit

struct FlickrPhoto {
    
    let farmID: Int
    let serverID: String
    let photoID: String
    let secret: String
    let photoURL: String
    let image: UIImage
    
    init?(dictionary: [String:AnyObject]) {
        guard let farmID = dictionary["farm"] as? Int,
                  serverID = dictionary["server"] as? String,
                  photoID = dictionary["id"] as? String,
                  secret = dictionary["secret"] as? String
            
            else { return nil }
        
        self.farmID = farmID
        self.serverID = serverID
        self.photoID = photoID
        self.secret = secret
        self.photoURL = "https://farm\(farmID).staticflickr.com/\(serverID)/\(photoID)_\(secret)_z.jpg"
        
        guard let encoded = self.photoURL.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()),
                  url = NSURL(string: encoded),
                  data = NSData(contentsOfURL: url),
                  image = UIImage(data: data) else { return nil }
        
        self.image = image
    }
    
}