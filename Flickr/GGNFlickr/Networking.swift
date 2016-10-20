//
//  Networking.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 5/6/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import Foundation

protocol Networking {
    
    func request(response: NSData? -> ())
    
}