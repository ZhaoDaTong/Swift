//
//  Present.swift
//  testDemo
//
//  Created by Zhao on 16/4/13.
//  Copyright © 2016年 com.travelchinaguide. All rights reserved.
//

import Foundation
import UIKit

class Present: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
//        let storyboard: UIStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        let boudle: NSBundle = NSBundle.mainBundle()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: boudle)
        let toView = storyboard.instantiateViewControllerWithIdentifier("TestViewController")
        UIView.animateWithDuration(self.transitionDuration(transitionContext), delay: 0.0, usingSpringWithDamping: 0.64, initialSpringVelocity: 0.22, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            toView.view.center = CGPoint(x: 100, y: 100)
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }
}