//
//  AnimatedTransitioning.swift
//  CustomPresentationAndAnimation
//
//  Created by Garric Nahapetian on 5/20/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import UIKit

class AnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    internal var operation: UINavigationControllerOperation = .None
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let container = transitionContext.containerView()
        , fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        , toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        , fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        , toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        
        else { return }
        
        let containerFrame = container.frame
        var fromViewStartFrame = transitionContext.initialFrameForViewController(fromViewController)
        var toViewStartFrame = transitionContext.initialFrameForViewController(toViewController)
        let toViewFinalFrame = transitionContext.finalFrameForViewController(toViewController)
        var fromViewFinalFrame = transitionContext.finalFrameForViewController(fromViewController)
        
        fromViewStartFrame = containerFrame
        fromViewFinalFrame.size.width = containerFrame.width
        fromViewFinalFrame.size.height = containerFrame.height
        
        toViewStartFrame.size.width = containerFrame.width
        toViewStartFrame.size.height = containerFrame.height
        toViewStartFrame.origin.y = 0

        if operation == .Push {
            toViewStartFrame.origin.x = container.frame.width
            fromViewFinalFrame.origin.x -= containerFrame.width
        } else if operation == .Pop {
            toViewStartFrame.origin.x = -container.frame.width
            fromViewFinalFrame.origin.x += containerFrame.width
        }
        
        container.addSubview(fromView)
        container.addSubview(toView)
        fromView.frame = fromViewStartFrame
        toView.frame = toViewStartFrame

        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            fromView.frame = fromViewFinalFrame
            toView.frame = toViewFinalFrame
        }) { completed in
            if completed {
                transitionContext.completeTransition(completed)
                if self.operation == .Pop {
                    fromView.removeFromSuperview()
                }
            }
        }
    }
}







