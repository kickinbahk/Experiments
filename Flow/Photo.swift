//
//  Photo.swift
//  Flow
//
//  Created by Garric Nahapetian on 1/15/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//


import UIKit

struct Photo {
    let farmID: Int
    let serverID: String
    let photoID: String
    let secret: String
    let photoURL: URL
    var image: UIImage?
    
    init?(fromJSON json: [String: Any]) {
        guard
            let farmID = json["farm"] as? Int,
            let serverID = json["server"] as? String,
            let photoID = json["id"] as? String,
            let secret = json["secret"] as? String
            else {
                return nil
        }
        
        let resourceString = "https://farm\(farmID).staticflickr.com/\(serverID)/\(photoID)_\(secret)_z.jpg"
        
        guard
            let encoded = resourceString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: encoded)
            else {
                return nil
        }
        
//        do {
//            let data = try Data(contentsOf: url)
//            
//            guard let image = UIImage(data: data) else {
//                return nil
//            }
        
            self.farmID = farmID
            self.serverID = serverID
            self.photoID = photoID
            self.secret = secret
            self.photoURL = url
//            self.image = image
            
//        } catch {
//            return nil
//        }
    }
}
