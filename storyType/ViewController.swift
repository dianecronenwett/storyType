//
//  ViewController.swift
//  storyType
//
//  Created by Diane Garcia on 12/6/14.
//  Copyright (c) 2014 Diane Cronenwett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var backgroundCount = [
        UIImage(named: "hook_320"),
        UIImage(named: "pan_320"),
        UIImage(named: "image_3"),
    ]
   


    @IBOutlet weak var backgroundImages: UIImageView!
    @IBOutlet weak var storyText: UITextView!
    @IBOutlet weak var buttonHide: UIButton!
    
    var counter = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageUpdate()
        Hide()
    }

    @IBAction func nextButton(sender: AnyObject) {
     
       //whichever image it is on, go to the next one in the array
       counter++
        if (counter >= backgroundCount.count) {
            counter = 0

        }
        imageUpdate()
        Hide()
    }

    
    @IBAction func previousButton(sender: UIButton) {
        counter--
        if (counter < 0) {
            counter = backgroundCount.count - 1
           
        }
       imageUpdate()
        Hide()
    }
    
    func Hide() {
    if (counter == 0) {
    buttonHide.hidden = true
        
    } else {
    buttonHide.hidden = false
    }
        
    }
    
    
    //helper function for updating images
    func imageUpdate() {
        backgroundImages.image = backgroundCount[counter]
        //println(counter)
        
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

