# Reachability
Super simple way to determine if device can access the internet via Apple's Reachability class

To use Reachability in your apps:

1) Add the files to your project

2) Declare a global constant: `internal let reachabilityManager = ReachabilityManager.sharedInstance`

3) To be notified of reachability status changes, subscribe your objects to the `statusChangedNotification` notification and implement the selector somewhere in your object's file.

Example:

`class YourViewController: UIViewController {`

       override func viewDidLoad() {
       
                super.viewDidLoad()

                 NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityStatusChanged:", name:                         reachabilityManager.statusChangedNotification, object: nil)
    
       }
       
       func reachabilityStatusChanged(notification: NSNotification) {
              
              // Check reachability status and handle case
              // Also, I think you can have a notification be sent with an object so you could have the notification
              // include the reachability status
              
       }
`}`


4) Anytime you want to check reachability status use: `reachabilityManager.networkStatus != NotReachable`

Example:

`guard reachabilityManager.networkStatus != NotReachable else {`
       
       // Handle case where internet is not reachable
       return
`}`
 
 `// Handle case where internet is reachable`
 
 You can also check the specific reachability type:
 - via Wifi: `reachabilityManager.networkStatus == ReachableWithWifi`
 - via WWAN: `reachabilityManager.networkStatus == ReachableWithWWAN`
 
Credit to: https://www.youtube.com/watch?v=BlBhHgoW9wM
