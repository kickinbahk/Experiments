//
//  PresentingViewController.swift
//  CustomPresentationAndAnimation
//
//  Created by Garric Nahapetian on 5/17/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import UIKit

class PresentingViewController: UIViewController {
    
    @IBAction func actionButtonTapped(sender: UIButton) {
        let presentedViewController = PresentedViewController()
        presentedViewController.delegate = self

        let navigationController = UINavigationController(rootViewController: presentedViewController)
        navigationController.modalPresentationStyle = .Custom
        navigationController.transitioningDelegate = presentedViewController
        navigationController.delegate = presentedViewController
        navigationController.setNavigationBarHidden(true, animated: false)
        presentViewController(navigationController, animated: true, completion: nil)
    }
    
}

extension PresentingViewController: PresentedViewControllerDelegate {
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}