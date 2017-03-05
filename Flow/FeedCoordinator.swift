//
//  FeedCoordinator.swift
//  Flow
//
//  Created by Garric Nahapetian on 1/21/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//

import UIKit

class FeedCoordinator: Coordinating {
    weak var delegate: ChildCoordinatorDelegate?
    private(set) var rootViewController: UIViewController!
    
    fileprivate weak var viewModel: FeedVM!
    private var childCoordinators: [Coordinating] = []
    private let fetcher: Fetcher
    
    init(service: Fetcher) {
        self.fetcher = service
    }
    
    var start: Void {
        fetcher.fetch(with: request) { [weak self] json in
            guard let weakSelf = self else { return }
            let dictionary = json["photos"] as? [String: Any] ?? [:]
            let array = dictionary["photo"] as? [[String: Any]] ?? []
            let items = array.flatMap { Photo(json: $0) }
            let viewModel = FeedVM(items: items)
            weakSelf.viewModel = viewModel
            weakSelf.rootViewController = FeedVC(viewModel: viewModel)
            DispatchQueue.main.async {
                weakSelf.delegate?.childCoordinatorIsReady(childCoordinator: weakSelf)
            }
        }
    }
    
    private var request: URLRequest {
        let query = "https://api.flickr.com/services/rest/?method=flickr.galleries.getPhotos&api_key=\(Private.apiKey)&gallery_id=72157664540660544&format=json&nojsoncallback=1"
        let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encoded)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}

extension FeedCoordinator: FeedDelegate {
    func didSelect(_ photo: Photo) {
        let photoVC = PhotoVC(photo: photo)
        rootViewController.navigationController?.pushViewController(photoVC, animated: true)
    }
}
