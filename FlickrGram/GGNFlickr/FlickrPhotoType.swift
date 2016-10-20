//
//  FlickrPhotoType.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 5/26/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import UIKit

protocol FlickrPhotoType {
    var imageURL: NSURL { get }
    var image: UIImage { get }
    var icon: UIImage { get }
    var iconURL: NSURL { get }
    var ownername: String { get }
    var uploadDate: NSDate { get }
}
