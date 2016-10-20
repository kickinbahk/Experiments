//
//  PhotoFetcherTests.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 5/8/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import XCTest
import Swinject
@testable import GGNFlickr

class PhotoFetcherTests: XCTestCase {

    var container: Container?
    var photos: [FlickrPhoto]?
    
    override func setUp() {
        super.setUp()
        
        container = Container()
        container?.register(Networking.self, name: "stub") { _ in StubNetwork() }
        container?.register(PhotoFetcher.self, name: "stub") { r in PhotoFetcher(networking: r.resolve(Networking.self, name: "stub")!) }

        let fetcher = container?.resolve(PhotoFetcher.self, name: "stub")!
        fetcher?.fetch { self.photos = $0 }
        
    }
    
    override func tearDown() {
        container = nil
        photos = nil
        super.tearDown()
    }

    func testPhotoFetcherReturnsNotNil() {
        XCTAssertNotNil(photos)
    }
    
    func testPhotoObjectPropertiesNotNil() {
        XCTAssertNotNil(photos?[0].farmID)
        XCTAssertNotNil(photos?[0].serverID)
        XCTAssertNotNil(photos?[0].photoID)
        XCTAssertNotNil(photos?[0].secret)
        XCTAssertNotNil(photos?[0].photoURL)
        XCTAssertNotNil(photos?[0].image)
    }
    
    func testPhotoObjectPropertiesEqualExpected() {
        XCTAssertEqual(photos?[0].farmID, 2)
        XCTAssertEqual(photos?[0].serverID, "1496")
        XCTAssertEqual(photos?[0].photoID, "25948145712")
        XCTAssertEqual(photos?[0].secret, "38ff1136de")
        XCTAssertEqual(photos?[0].photoURL, "https://farm\((photos?[0].farmID)!).staticflickr.com/\((photos?[0].serverID)!)/\((photos?[0].photoID)!)_\((photos?[0].secret)!)_z.jpg")
    }
    
    func testPhotoObjectPropertiesNotEqualExpected() {
        let randomNumber = 1234
        let randomString = "random string"
        XCTAssertNotEqual(photos?[0].farmID, randomNumber)
        XCTAssertNotEqual(photos?[0].serverID, randomString)
        XCTAssertNotEqual(photos?[0].photoID, randomString)
        XCTAssertNotEqual(photos?[0].photoURL, randomString)
    }
    
}

struct StubNetwork: Networking {
    
    private static let json =
        
        "{" +
            "\"photos\":" +
                "{" +
                    "\"page\": 1," +
                    "\"pages\": 1," +
                    "\"perpage\": 500," +
                    "\"photo\":" +
                        "[" +
                            "{" +
                                "\"farm\": 2," +
                                "\"has_comment\": 0," +
                                "\"id\": \"25948145712\"," +
                                "\"is_primary\": 1," +
                                "\"isfamily\": 0," +
                                "\"isfriend\": 0," +
                                "\"ispublic\": 1," +
                                "\"owner\": \"15876656@N05\"," +
                                "\"secret\": \"38ff1136de\"," +
                                "\"server\": \"1496\"," +
                                "\"title\": \"Lost in thought and lost in time..\"" +
                            "}" +
                        "]" +
                "}" +
        "}"
    
    func request(response: NSData? -> ()) {
        let data = StubNetwork.json.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        response(data)
    }
}











