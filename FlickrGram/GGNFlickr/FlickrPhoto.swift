//
//  FlickrPhoto.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 4/14/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import Foundation
import UIKit

struct FlickrPhoto: FlickrPhotoType {
    
    let ownername: String
    let icon: UIImage
    let iconURL: NSURL
    let imageURL: NSURL
    let image: UIImage
    let uploadDate: NSDate
    
    init?(dictionary: [String:AnyObject]) {
        guard let farm = dictionary["farm"] as? Int
                , serverID = dictionary["server"] as? String
                , id = dictionary["id"] as? String
                , secret = dictionary["secret"] as? String
                , iconfarm = dictionary["iconfarm"] as? Int
                , iconserver = dictionary["iconserver"] as? String
                , owner = dictionary["owner"] as? String
                , ownername = dictionary["ownername"] as? String
                , dateuploadStringInterval = dictionary["dateupload"] as? String
                , timeinterval = Double(dateuploadStringInterval)
        
            else { return nil }
        
        let imageSourceString = "https://farm\(farm).staticflickr.com/\(serverID)/\(id)_\(secret)_z.jpg"
        let iconSourceString = "https://farm\(iconfarm).staticflickr.com/\(iconserver)/buddyicons/\(owner).jpg"
        
        guard let encodedImageSourceString = imageSourceString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
                , imageURL = NSURL(string: encodedImageSourceString)
                , imageData = NSData(contentsOfURL: imageURL)
                , image = UIImage(data: imageData)
        
            else { return nil }
        
        guard let encodedIconSourceString = iconSourceString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
                , iconURL = NSURL(string: encodedIconSourceString)
                , iconData = NSData(contentsOfURL: iconURL)
                , icon = UIImage(data: iconData)
        
            else { return nil }
        
        self.ownername = ownername
        self.uploadDate = NSDate(timeIntervalSince1970: timeinterval)
        self.icon = icon
        self.iconURL = iconURL
        self.imageURL = imageURL
        self.image = image
    }
}