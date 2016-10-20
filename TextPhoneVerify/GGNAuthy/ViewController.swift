//
//  ViewController.swift
//  GGNAuthy
//
//  Created by Garric Nahapetian on 5/9/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    var phoneNumber: String?
    var code: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func resetUIForState(state: State) {
        self.editing = false
        textField.text?.removeAll()
        textField.keyboardType = .NumberPad
        switch state {
        case .Phone:
            textField.placeholder = "Enter your phone #"
            actionButton.setTitle("Continue", forState: .Normal)
        case .Code:
            textField.placeholder = "Enter the code"
            actionButton.setTitle("Verify", forState: .Normal)
        }
    }
    
    @IBAction func actionButtonTapped(sender: UIButton) {
        let title = sender.currentTitle!
        switch title {
        case "Continue":
            phoneNumber = textField.text
            PFCloud.callFunctionInBackground("sendText", withParameters: ["phoneNumber" : phoneNumber!]) { response, error in
                guard let response = response as? NSDictionary, code = response.valueForKey("code") as? Int else { return }
                self.code = code
                dispatch_async(dispatch_get_main_queue()) {
                    self.resetUIForState(.Code)
                }
            }
        case "Verify":
            if String(self.code!) == textField.text! {
                PFUser.currentUser()!["phoneNumber"] = phoneNumber!
                PFUser.currentUser()!["phoneNumberVerified"] = true
                PFUser.currentUser()!.saveInBackground()
            }
        default: break
        }
    }
}

enum State {
    case Phone
    case Code
}

