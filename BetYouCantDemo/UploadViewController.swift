//
//  UploadViewController.swift
//  BetYouCantDemo
//
//  Created by İsmail GÜNCAN on 09/07/15.
//  Copyright (c) 2015 İsmail GÜNCAN. All rights reserved.
//

import Parse
import UIKit

class UploadViewController: UIViewController,UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var uploadPreviewImage: UIImageView!
    
    @IBOutlet weak var uploadMessage: UITextField!
    
    @IBOutlet weak var uploadImageText: UIButton!
    
    // take or upload image button
    @IBAction func addImageFromSource(sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        //** if u want use .camera for Taking Pictures
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker , animated: true , completion: nil)
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        uploadPreviewImage.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        uploadImageText.titleLabel?.text = "Change"
        
    }
    @IBAction func uploadButton(sender: AnyObject) {
        
        var imageText = uploadMessage.text
        
        if uploadPreviewImage.image == nil {
            //image is not included alert user ..
            print("image is not uploaded")
        }else {
            
            var posts = PFObject(className: "ImagePosts")
            // How can that imagetext save on Parse
            posts["imageText"] = imageText
            posts["uploader"] = PFUser.currentUser()
            posts.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                
                if error == nil {
                    // success saving . Now save image
                    
                    // create an image data , create a parse file to store in cloud
                    var imageData = UIImagePNGRepresentation(self.uploadPreviewImage.image)
                    // create Parse File now
                    var parseImageFile = PFFile(name : "uploaded_image.png" , data: imageData)
                    posts["imageFile"] = parseImageFile
                    posts.saveInBackgroundWithBlock({ (success:Bool,error: NSError?) -> Void in
                        
                        if error == nil {
                            // go home page
                            print("Data Uploaded successfully")
                            self.performSegueWithIdentifier("goHomeFromUpload", sender: self)
                            
                        } else {
                            print(error)
                        }
                    })
                    
                    
                    
                } else {
                    print(error)
                }
            })

            
            
        }
        
    }
    
}
