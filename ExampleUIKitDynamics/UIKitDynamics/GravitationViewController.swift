//
//  GravitationViewController.swift
//  UIKitDynamics
//
//  Created by AppStarter on 02.12.2015.
//  Copyright © 2015 AppStarter. All rights reserved.
//

import UIKit

class GravitationViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var animator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: self.view)
        let gravityBeahvior = UIGravityBehavior(items: [imageView])
        // dodanie imageView któremu ma być nadana grawitacja
        gravityBeahvior.gravityDirection = CGVectorMake(0.0, 0.1)
        // podanie wartości grawitacji, dla tego przykładu 0.1 na osi y
        animator.addBehavior(gravityBeahvior)
    }
}
