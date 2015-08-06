//
//  SignUpViewController.swift
//  BetYouCantDemo
//
//  Created by İsmail GÜNCAN on 09/07/15.
//  Copyright (c) 2015 İsmail GÜNCAN. All rights reserved.
//

import Parse
import UIKit

class SignUpViewController: UIViewController {

    func displayAlert(title :String,message :String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil) // alert ekranını gösteriyo .
        
    }
    
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    @IBAction func SignUpButtonAction(sender: AnyObject) {
        var username = UserNameTextField.text
        var email = EmailTextField.text
        var password = PasswordTextField.text
        
        if username!.isEmpty || email!.isEmpty || password!.isEmpty {
            
            displayAlert("Error in Form", message: "Please fill whole form")
        }
        else {
            
            var user = PFUser()
            user.username = username
            user.password = password
            user.email = email
            
            user.signUpInBackgroundWithBlock({ (success:Bool,error:NSError?) -> Void in
                
                if error == nil {
                    //Successfully Sign - Up
                    self.displayAlert("Successfully Sign Up", message: "Have Fun")
                    
                }else {
                    //Error
                    print(error)
                }
            })
        }
    }
    
}
