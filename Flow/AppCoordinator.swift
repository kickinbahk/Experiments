//
//  AppCoordinator.swift
//  Flow
//
//  Created by Garric Nahapetian on 1/15/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//

import UIKit

class AppCoordinator {
    private var navigationController: UINavigationController!
    private var feedCoordinator: FeedCoordinator!

    func resolvedWindow(from launchOptions: LaunchOptions) -> UIWindow {
        assert(launchOptions == nil, "LaunchOptions is not nil. Handle launch options.")
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = resolvedLoadingVC()
        window.makeKeyAndVisible()
        return window
    }

    private func resolvedLoadingVC() -> UINavigationController {
        navigationController = UINavigationController(rootViewController: LoadingVC())
        startFeed()
        return navigationController
    }
    
    private func startFeed() {
        let feedCoordinator = Resolved.feedCoordinator()
        self.feedCoordinator = feedCoordinator
        self.feedCoordinator.isReadyOutput.onNext { [weak self] in
            self?.navigationController.viewControllers[0] = feedCoordinator.rootViewController
        }
        self.feedCoordinator.start()
    }
}
