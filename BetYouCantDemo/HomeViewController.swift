//
//  ViewController.swift
//  BetYouCantDemo
//
//  Created by İsmail GÜNCAN on 08/07/15.
//  Copyright (c) 2015 İsmail GÜNCAN. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        PFUser.logOutInBackground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

