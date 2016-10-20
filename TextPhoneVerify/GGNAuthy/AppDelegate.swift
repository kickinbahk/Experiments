//
//  AppDelegate.swift
//  GGNAuthy
//
//  Created by Garric Nahapetian on 5/9/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Parse.enableLocalDatastore()
        Parse.setApplicationId(ParseConstants.id, clientKey: ParseConstants.clientKey)
        
        if PFUser.currentUser() != nil {
            print("User")
        } else {
            let user = PFUser()
            user.username = "Garric"
            user.password = "password"
            user.signUpInBackground()
        }

        return true
    }

}

