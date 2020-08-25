//
//  TransitionManager.swift
//  NavControllerAnimation
//
//  Created by Sergey Desyak on 25.08.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class AnimationPush: NSObject , UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    private let presenting: Bool
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let container = transitionContext.containerView
        let fromView = transitionContext.viewController(forKey: .from)!
        let toView = transitionContext.viewController(forKey: .to)!
        let offScreenRight: CGAffineTransform
        let offScreenLeft: CGAffineTransform
        
    
        if presenting {
            container.addSubview(toView.view)
             offScreenRight = CGAffineTransform(translationX: container.frame.width, y: 0)
             offScreenLeft = CGAffineTransform(translationX: -container.frame.width, y: 0)
        } else {
            container.insertSubview(toView.view, belowSubview: fromView.view)
             offScreenRight = CGAffineTransform(translationX: -container.frame.width, y: 0)
             offScreenLeft = CGAffineTransform(translationX: container.frame.width, y: 0)
        }
        
        
     
        //container.addSubview(toView.view)
        //toView.view.frame = fromView.view.frame
        //container.addSubview(fromView.view)
        
        toView.view.transform = offScreenRight
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.49, initialSpringVelocity: 0.81, options: [], animations: { () -> Void in
            fromView.view.transform = offScreenLeft
            toView.view.transform = .identity
        }) { finished in
            let success = !transitionContext.transitionWasCancelled
            if !success {
                toView.view.removeFromSuperview()
            }
            transitionContext.completeTransition(true)
        }
        print("Push")
    }
    
    init(presenting: Bool) {
        self.presenting = presenting
    }
    
}

class AnimationPop: NSObject , UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
 
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let container = transitionContext.containerView
        let fromView = transitionContext.viewController(forKey: .from)!
        let toView = transitionContext.viewController(forKey: .to)!
        container.addSubview(toView.view)
        //container.addSubview(fromView.view)
        container.sendSubviewToBack(toView.view)
         fromView.view.frame = toView.view.frame
        
        
   
        let offScreenRight = CGAffineTransform(translationX: -container.frame.width, y: 0)
        let offScreenLeft = CGAffineTransform(translationX: container.frame.width, y: 0)
        
    
        toView.view.transform = offScreenRight
        
        
//        container.insertSubview(toView.view, belowSubview: fromView.view)
//        container.addSubview(fromView.view)
        

        
       
        let duration = self.transitionDuration(using: transitionContext)
        
     
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.49, initialSpringVelocity: 0.81, options: [], animations: { () -> Void in
            fromView.view.transform = offScreenLeft
            toView.view.transform = .identity
        }) { finished in
           
            if finished && !transitionContext.transitionWasCancelled {
                       fromView.removeFromParent()
                   } else if transitionContext.transitionWasCancelled {
                       toView.view.transform = .identity
                   }
                transitionContext.completeTransition(true)
            }
        
        print("Pop")
    }
    

}
