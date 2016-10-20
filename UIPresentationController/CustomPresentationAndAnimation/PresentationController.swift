//
//  PresentationController.swift
//  CustomPresentationAndAnimation
//
//  Created by Garric Nahapetian on 5/17/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    
    let dimmingView = UIView()
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        let x: CGFloat = 0.0
        let y: CGFloat = 200
        let width = containerView!.frame.width
        let height = containerView!.frame.height - y
        let rect = CGRect(x: x, y: y, width: width, height: height)
        return rect
    }
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = UIScreen.mainScreen().bounds
        dimmingView.backgroundColor = .blackColor()
        dimmingView.alpha = 0.0
        containerView?.addSubview(dimmingView)

        self.presentingViewController.transitionCoordinator()?.animateAlongsideTransition({ _ in
            self.dimmingView.alpha = 0.5
        }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        self.presentingViewController.transitionCoordinator()?.animateAlongsideTransition({ _ in
            self.dimmingView.alpha = 0.0
        }) { _ in
            self.dimmingView.removeFromSuperview()
        }
    }
    
}
