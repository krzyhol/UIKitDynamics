//
//  AttachmentViewController.swift
//  UIKitDynamics
//
//  Created by AppStarter on 02.12.2015.
//  Copyright © 2015 AppStarter. All rights reserved.
//

import UIKit

class AttachmentViewController: UIViewController {
    
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
        
        attachmentBehavior = UIAttachmentBehavior(item: textImageView, attachedToAnchor: logoCenter)
        
        animator.addBehavior(collisionBehavior)
        animator.addBehavior(attachmentBehavior)
    }
    
    
    @IBAction func handleAttachmentGesture(gesture: UIPanGestureRecognizer) {
        let gesturePoint = gesture.locationInView(view)
        
        logoImageView.center = gesturePoint
        attachmentBehavior.anchorPoint = gesturePoint
    }
}
