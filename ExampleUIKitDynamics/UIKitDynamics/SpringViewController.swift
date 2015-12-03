//
//  SpringViewController.swift
//  UIKitDynamics
//
//  Created by AppStarter on 02.12.2015.
//  Copyright © 2015 AppStarter. All rights reserved.
//

import UIKit

class SpringViewController: UIViewController {

    @IBOutlet weak var textImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: self.view)
        let collisionBehavior = UICollisionBehavior(items: [textImageView, logoImageView])
        
        let logoCenter = CGPoint(x: logoImageView.center.x, y: logoImageView.center.y)
        
        collisionBehavior.collisionMode = UICollisionBehaviorMode.Boundaries
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        let gravityBeahvior = UIGravityBehavior(items: [textImageView])
        // dodanie imageView któremu ma być nadana grawitacja
        gravityBeahvior.gravityDirection = CGVectorMake(0.0, 0.1)
        // podanie wartości grawitacji, dla tego przykładu 0.1 na osi y
        
        attachmentBehavior = UIAttachmentBehavior(item: textImageView, attachedToAnchor: logoCenter)
        attachmentBehavior.frequency = 1.0
        attachmentBehavior.damping = 0.1
        attachmentBehavior.length = 100.0
        
        animator.addBehavior(gravityBeahvior)
        animator.addBehavior(collisionBehavior)
        animator.addBehavior(attachmentBehavior)
    }
    
    @IBAction func handleAttachmentGesture(gesture: UIPanGestureRecognizer) {
        let gesturePoint = gesture.locationInView(view)
        
        logoImageView.center = gesturePoint
        attachmentBehavior.anchorPoint = gesturePoint
    }
}
