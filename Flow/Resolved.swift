//
//  Resolved.swift
//  Flow
//
//  Created by Garric G. Nahapetian on 1/28/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//

import UIKit

enum Resolved {
    static func feedCoordinator() -> FeedCoordinator {
        let viewModel = Resolved.feedVM()
        let viewController = Resolved.feedVC(with: viewModel)
        return FeedCoordinator(
            viewController: viewController,
            viewModel: viewModel
        )
    }
    
    private static func feedVC(with viewModel: FeedVM) -> FeedVC {
        return FeedVC(viewModel: viewModel)
    }
    
    private static func feedVM() -> FeedVM {
        let fetcher = Resolved.fetcher()
        return FeedVM(fetcher: fetcher)
    }

    private static func fetcher() -> Fetcher {
        return Fetcher()
    }
}
