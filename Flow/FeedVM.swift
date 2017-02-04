//
//  FeedVM.swift
//  Flow
//
//  Created by Garric Nahapetian on 1/15/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//


import UIKit
import GGNObservable

class FeedVM {
    let doneRefreshingOutput = Observable<Void>()
    var numberOfRows: Int { return items.count }
    
    private let fetcher: Fetcher
    private var items: [Photo] = []

    init(fetcher: Fetcher) {
        self.fetcher = fetcher
        self.fetcher.output.onNext { json in
            let dictionary = json["photos"] as? [String: Any] ?? [:]
            let array = dictionary["photo"] as? [[String: Any]] ?? []
            self.items = array.flatMap { Photo(fromJSON: $0) }
            self.doneRefreshingOutput.emit()
        }
    }
    
    func refreshFeed() {
        let query = "https://api.flickr.com/services/rest/?method=flickr.galleries.getPhotos&api_key=\(Private.apiKey)&gallery_id=72157664540660544&format=json&nojsoncallback=1"
        let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encoded)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        fetcher.fetch(with: request)
    }
    
    func image(at indexPath: IndexPath) -> UIImage? {
        var item = items[indexPath.row]
        let url = item.photoURL

        guard item.image == nil else {
            return item.image
        }

        do {
            let data = try Data(contentsOf: url)
            
            guard let image = UIImage(data: data) else {
                return nil
            }
            
            item.image = image
            return item.image
        } catch {
            print("error")
            return nil
        }
    }
    
    func prefetchImage(at indexPath: IndexPath) {
        var item = items[indexPath.row]
        let url = item.photoURL
        
        do {
            let data = try Data(contentsOf: url)
            
            guard let image = UIImage(data: data) else {
                return
            }
            
            item.image = image
        } catch {
            print("error")
            return
        }
    }
}
