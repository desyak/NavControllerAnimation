//
//  ViewController.swift
//  NavControllerAnimation
//
//  Created by Sergey Desyak on 25.08.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = transitionManager
        
    }

    @IBAction  func unwindToViewController(sender: UIStoryboardSegue) {
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toViewController = segue.destination as UIViewController
        toViewController.modalPresentationStyle = .overCurrentContext
        toViewController.transitioningDelegate = transitionManager
      
        
    }

 
}

