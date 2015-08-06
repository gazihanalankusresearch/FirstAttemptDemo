//
//  LoginViewController.swift
//  BetYouCantDemo
//
//  Created by İsmail GÜNCAN on 09/07/15.
//  Copyright (c) 2015 İsmail GÜNCAN. All rights reserved.
//

import Parse
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    func displayAlert(title :String,message :String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil) // alert ekranını gösteriyo .
        
    }
    
    @IBAction func loginActionButton(sender: AnyObject) {
        
        var username = usernameTextField.text
        var password = passwordTextField.text
        
        if username.isEmpty || password.isEmpty {
            
            displayAlert("Error in form", message: "Enter username and password")
            
        } else {
            
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user: PFUser?,error:NSError?) -> Void in
                
                if error == nil {
                    //self.displayAlert("Successfully Logged in", message: "You are in Bitch!")
                    self.performSegueWithIdentifier("mainpage", sender: nil)
                    }
                else {
                    self.displayAlert("Wrong Username || Password ", message: "Try again ")
                    }
                })
            
        }
    }
}
