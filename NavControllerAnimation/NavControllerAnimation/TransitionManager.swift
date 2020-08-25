//
//  TransitionManager.swift
//  NavControllerAnimation
//
//  Created by Sergey Desyak on 25.08.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class TransitionManager: NSObject , UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    let count = 7
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // код анимации
            // 1
        let container = transitionContext.containerView
        let fromView = transitionContext.viewController(forKey: .from)!
        let toView = transitionContext.viewController(forKey: .to)!
                
            // 2
        let offScreenRight = CGAffineTransform(translationX: container.frame.width, y: 0)
        let offScreenLeft = CGAffineTransform(translationX: -container.frame.width, y: 0)
                
            // 3
        toView.view.transform = offScreenRight
                
            // 4
        container.addSubview(toView.view)
        //container.addSubview(fromView.view)
                
            // 5
        let duration = self.transitionDuration(using: transitionContext)
                
            // 6
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.49, initialSpringVelocity: 0.81, options: [], animations: { () -> Void in
            fromView.view.transform = offScreenLeft
            toView.view.transform = .identity
                }) { finished in
                    // 7
                    transitionContext.completeTransition(true)
            }
        print("change")
    }
    
    // MARK: методы протокола UIViewControllerTransitioningDelegate
    
    // аниматор для презентации viewcontroller
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    // аниматор для скрытия viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

}
