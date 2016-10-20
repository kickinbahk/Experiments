//
//  PushedViewController.swift
//  CustomPresentationAndAnimation
//
//  Created by Garric Nahapetian on 5/20/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import UIKit

class PushedViewController: UIViewController {

    weak var delegate: PushedViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .redColor()
        view.alpha = 0.5
        
        func setupPushButton() {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Pop", forState: .Normal)
            button.addTarget(self, action: #selector(popButtonTapped(_:)), forControlEvents: .TouchUpInside)
            view.addSubview(button)
            
            NSLayoutConstraint(item: button, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0.0).active = true
            NSLayoutConstraint(item: button, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        }
        setupPushButton()
        
    }
    
    func popButtonTapped(sender: UIButton) {
        delegate?.pop()
    }

}