//
//  ViewController.swift
//  CollisionUIKitDynamic
//
//  Created by AppStarter on 03.12.2015.
//  Copyright © 2015 AppStarter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textCollisionLabel: UILabel!
    @IBOutlet weak var logoCollisionLabel: UILabel!
    
    @IBOutlet weak var textImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var animator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        
    }
}
