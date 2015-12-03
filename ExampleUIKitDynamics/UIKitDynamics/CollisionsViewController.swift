//
//  CollisionsViewController.swift
//  UIKitDynamics
//
//  Created by AppStarter on 02.12.2015.
//  Copyright © 2015 AppStarter. All rights reserved.
//

import UIKit

class CollisionsViewController: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var collisionOneLabel: UILabel!
    @IBOutlet weak var collisionTwoLabel: UILabel!

    @IBOutlet weak var textImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var animator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
        let gravityBeahvior = UIGravityBehavior(items: [textImageView, logoImageView])
        gravityBeahvior.gravityDirection = CGVectorMake(0.0, 0.1)
        
        let collisionBehavior = UICollisionBehavior(items: [textImageView, logoImageView])
        collisionBehavior.collisionMode = UICollisionBehaviorMode.Everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        animator.addBehavior(gravityBeahvior)
        animator.addBehavior(collisionBehavior)
        
        collisionBehavior.collisionDelegate = self
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        if item.isEqual(textImageView) {
            collisionOneLabel.text = "Text - kolizja"
        }
        if item.isEqual(logoImageView) {
            collisionTwoLabel.text = "Logo - kolizja"
        }
    }
}
