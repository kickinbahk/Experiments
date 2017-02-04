//
//  FeedCoordinator.swift
//  Flow
//
//  Created by Garric Nahapetian on 1/21/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//

import UIKit
import GGNObservable

class FeedCoordinator {
    let isReadyOutput = Observable<Void>()
    
    private(set) var rootViewController: FeedVC
    private weak var viewModel: FeedVM?

    init(viewController: FeedVC, viewModel: FeedVM) {
        self.rootViewController = viewController
        self.viewModel = viewModel
        self.viewModel?.doneRefreshingOutput.onNext { [weak self] in
            self?.isReadyOutput.emit()
        }
    }
    
    func start() {
        viewModel?.refreshFeed()
    }
}
