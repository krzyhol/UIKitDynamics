//
//  ViewController.swift
//  UIKitDynamics
//
//  Created by AppStarter on 02.12.2015.
//  Copyright © 2015 AppStarter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Grawitacja"
        case 1:
            cell.textLabel?.text = "Kolizje"
        case 2:
            cell.textLabel?.text = "Powiązania"
        case 3:
            cell.textLabel?.text = "Sprężynowanie"
        default: ()
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var viewController = UIViewController()
        
        switch indexPath.row {
        case 0:
            viewController = (self.storyboard?.instantiateViewControllerWithIdentifier("GravitationViewControllerIdentifier") as? GravitationViewController)!
        case 1:
            viewController = (self.storyboard?.instantiateViewControllerWithIdentifier("CollisionsViewControllerIdentifier") as? CollisionsViewController)!
        case 2:
            viewController = (self.storyboard?.instantiateViewControllerWithIdentifier("AttachmentViewControllerIdentifier") as? AttachmentViewController)!
        case 3:
            viewController = (self.storyboard?.instantiateViewControllerWithIdentifier("SpringViewControllerIdentifier") as? SpringViewController)!
            
        default: ()
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

