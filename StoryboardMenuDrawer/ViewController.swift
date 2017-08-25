//
//  ViewController.swift
//  StoryboardMenuDrawer
//
//  Created by redEyeProgrammer on 8/24/17.
//  Copyright © 2017 redEye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var drawerButton: UIButton!
    @IBOutlet weak var leftMenuContainer: UIView!
    @IBOutlet weak var rightMenuContainer: UIView!
    
    @IBOutlet weak var mainViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var mainViewLeading: NSLayoutConstraint!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Use Constraints and Width to control DrawerMenu
    func toggleMenu(leftMenuDrawer: Bool){
        
        if leftMenuDrawer {
        let closed = mainViewLeading.constant == 0
        mainViewLeading.constant =  closed ? leftMenuContainer.frame.size.width : 0
        mainViewTrailing.constant = closed ? -leftMenuContainer.frame.size.width : 0
        } else {
            let closed = mainViewLeading.constant == 0
            mainViewLeading.constant =  closed ? -rightMenuContainer.frame.size.width : 0
            mainViewTrailing.constant = closed ? rightMenuContainer.frame.size.width : 0
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    //Note: Adjust width of left OR right menu container
    //in Storyboard to manipulate toggle to background view ratio.
    @IBAction func drawerMenuButton(sender: UIButton) {
        if sender.tag == 100 {
            //Toggle left
            toggleMenu(leftMenuDrawer: true)
            rightMenuContainer.isHidden = true
            leftMenuContainer.isHidden = false
        } else {
            //Toggle Right
            toggleMenu(leftMenuDrawer: false)
            rightMenuContainer.isHidden = false
            leftMenuContainer.isHidden = true
        }
       
    }
    
    //Close drawerMenu if Open
    @IBAction func tapAction(sender: UITapGestureRecognizer) {
        let closed = mainViewLeading.constant == 0
        if (!closed){toggleMenu(leftMenuDrawer: true)}
        
    }


}

