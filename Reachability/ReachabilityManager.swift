//
//  ReachabilityManager.swift
//  
//
//  Created by Garric Nahapetian on 12/1/15.
//  
//

import Foundation

class ReachabilityManager: NSObject {
    
    static let sharedInstance = ReachabilityManager()
    private let notReachable = "NotReachable"
    private let reachableViaWifi = "ReachableWithWifi"
    private let reachableViaWWAN = "ReachableWithWWAN"
    let statusChangedNotification = "reachabilityStatusChangedNotification"
    
    private var internetReach : Reachability?
    internal var networkStatus : NetworkStatus?
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kReachabilityChangedNotification, object: nil)
    }
    
    private override init() {
        super.init()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityChanged:", name: kReachabilityChangedNotification, object: nil)
        
        internetReach = Reachability.reachabilityForInternetConnection()
        if let internetReach = internetReach {
            internetReach.startNotifier()
            statusChangedWithReachability(internetReach)
            
        }
    }
    
    private func statusChangedWithReachability(status: Reachability) {

        switch status.currentReachabilityStatus().rawValue {
            
        case NotReachable.rawValue:
            networkStatus = NotReachable
        case ReachableViaWiFi.rawValue:
            networkStatus = ReachableViaWiFi
        case ReachableViaWWAN.rawValue:
            networkStatus = ReachableViaWWAN
        default: break
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName(statusChangedNotification, object: nil)
        
    }
    
    internal func reachabilityChanged(notification: NSNotification) {
        let reachability = notification.object as? Reachability
        if let reachability = reachability {
            statusChangedWithReachability(reachability)
        }
        
    }
    
}




