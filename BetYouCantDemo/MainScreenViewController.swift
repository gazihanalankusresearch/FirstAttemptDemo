//
//  MainScreenViewController.swift
//  BetYouCantDemo
//
//  Created by İsmail GÜNCAN on 09/07/15.
//  Copyright (c) 2015 İsmail GÜNCAN. All rights reserved.
//

import Parse
import UIKit

class MainScreenViewController: UIViewController , UITableViewDelegate {

    @IBOutlet weak var homePageTableView: UITableView!
    
    var imageFiles = [PFFile]()
    var imageText = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "ImagePosts")
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock {
            (posts:[AnyObject]?,error: NSError?) -> Void in
            
            if error == nil {
                // success fetching objects
                
                for post in posts! {
                    self.imageFiles.append(post["imageFile"] as! PFFile)
                    self.imageText.append(post["imageText"] as! String)
                }
                
                /***reload the table***/
                self.homePageTableView.reloadData()
            }
            else {
                print(error)
            }
        }
        
    }
    /***Table view begin ***/
    func tableView(tableView: UITableView , numberOfRowsInSection section: Int) -> Int {
        
        return imageFiles.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let singleCell: SingleRowCell = tableView.dequeueReusableCellWithIdentifier("mySingleCell") as! SingleRowCell
        //text
        singleCell.singleImageText.text = imageText[indexPath.row]
        //images
        imageFiles[indexPath.row].getDataInBackgroundWithBlock { (imageData:NSData?, error: NSError?) -> Void in
            
            if imageData != nil {
                
                let image = UIImage(data: imageData!)
                singleCell.singleUserImage.image = image
                
                
                
            }else {
                print(error)
            }
        }
        
        return singleCell
    }
   
}
