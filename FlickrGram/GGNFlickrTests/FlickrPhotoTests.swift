//
//  FlickrPhotoTests.swift
//  Tests
//
//  Created by Garric Nahapetian on 4/14/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import XCTest
@testable import GGNFlickr

class FlickrPhotoTests: XCTestCase {
    
    func testPhotoInitializesWithDictionary() {
        let dictionary: [String:AnyObject] = ["farm": 2,
                                              "id": "25948145712",
                                              "secret": "38ff1136de",
                                              "server": "1496"]
        let photo = FlickrPhoto(dictionary: dictionary)
        XCTAssertNotNil(photo)
        
    }
    
    func testPhotoInitializerFailsWithEmptyDictionary() {
        let dictionary = [String:AnyObject]()
        let photo = FlickrPhoto(dictionary: dictionary)
        XCTAssertNil(photo)
    }
    
    func testPhotoInitializerFailsWithPartialDictionary() {
        let dictionary: [String:AnyObject] = ["farm": 2]
        let photo = FlickrPhoto(dictionary: dictionary)
        XCTAssertNil(photo)
    }
    
    func testPhotoInitializerFailsWithUnrelatedDictionary() {
        let dictionary: [String:AnyObject] = ["tim": 2,
                                              "tam":"25948145712",
                                              "tom":"38ff1136de",
                                              "toom":"1496"]
        let photo = FlickrPhoto(dictionary: dictionary)
        XCTAssertNil(photo)
    }
    
    func testPhotoInitializerFailsWithInvalidDictionary() {
        let dictionary: [String:AnyObject] = ["farm": "2",
                                              "id": 259481,
                                              "secret": "38ff1136de",
                                              "server": 1496]
        let photo = FlickrPhoto(dictionary: dictionary)
        XCTAssertNil(photo)
    }
    
}












