//
//  AppDelegate.swift
//  Flow
//
//  Created by Garric Nahapetian on 1/15/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//


import UIKit

typealias LaunchOptions = [UIApplicationLaunchOptionsKey: Any]?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let appCoordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: LaunchOptions) -> Bool {
        window = appCoordinator.resolvedWindow(from: launchOptions)
        return true
    }
}
