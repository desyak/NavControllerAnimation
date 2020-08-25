//
//  ViewController.swift
//  NavControllerAnimation
//
//  Created by Sergey Desyak on 25.08.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   // private let transitionManager = AnimationPush()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitioningDelegate = self
        //self.transitioningDelegate = transitionManager
        
    }

    @IBAction  func unwindToViewController(sender: UIStoryboardSegue) {
        
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let toViewController = segue.destination as? ViewController
//
//        toViewController?.modalPresentationStyle = .custom
//        toViewController?.transitioningDelegate = self
//        //toViewController?.modalPresentationCapturesStatusBarAppearance = true
//
//
//    }
    
}
    extension ViewController: UIViewControllerTransitioningDelegate {

        func animationController(forPresented presented: UIViewController,
                                 presenting: UIViewController,
                                 source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return AnimationPush(presenting: true)
        }

        func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return AnimationPush(presenting: false)
        }
    }
 


