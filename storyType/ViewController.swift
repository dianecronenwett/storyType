//
//  ViewController.swift
//  storyType
//
//  Created by Diane Garcia on 12/6/14.
//  Copyright (c) 2014 Diane Cronenwett. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    var backgroundCount = [
        UIImage(named: "hook_320"),
        UIImage(named: "pan_320"),
        UIImage(named: "image_3"),
    ]
  
    var animatedImages = [
        UIImage(named: "hook_light_1"),
        UIImage(named: "pan_320_twinkling_stars_1"),
        UIImage(named: "jungle_1"),
    ]
    
    var animatedImages2 = [
        UIImage(named: "hook_light_2"),
        UIImage(named: "pan_320_twinkling_stars_2"),
        UIImage(named: "jungle_2"),
    
    ]
    
    var storyWords: [String] = [
        "Portland is fabulous this time of year","San Francisco is cold this time of year","Cupertino is meh this time of year"
    ]


    @IBOutlet weak var backgroundImages: UIImageView!
    @IBOutlet weak var storyText: UITextView!
    @IBOutlet weak var buttonHide: UIButton!
    @IBOutlet weak var sparkleStars1: UIImageView!
    @IBOutlet weak var sparkleStars2: UIImageView!

  
    var counter = 0;
    var animatedImagesStart = 0;
    var animatedImagesStart2 = 0;
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyText.alpha = 0.1
        sparkleStars1.alpha = 0.2
        sparkleStars2.alpha = 0.5
        storyUpdate()
        imageUpdate()
        textAnimate()
        imageAnimate()
        imageAnimate2()
        imageAnimateIn()
        Hide()
        
        
    }
    
    @IBAction func nextButton(sender: AnyObject) {
     
       //whichever image it is on, go to the next one in the array
      
       counter++
       animatedImagesStart++
       animatedImagesStart2++
        if (counter >= backgroundCount.count) {
            counter = 0
            animatedImagesStart = 0
            animatedImagesStart2 = 0
           
       }
        
        storyText.alpha = 0.1
        storyUpdate()
        imageUpdate()
        textAnimate()
        imageAnimate()
        imageAnimate2()
        imageAnimateIn()
        Hide()
        
    }

    
    @IBAction func previousButton(sender: UIButton) {
        counter--
        animatedImagesStart--
        animatedImagesStart2--
        if (counter < 0) {
            counter = backgroundCount.count - 1
            storyText.alpha = 0.1
        }
       storyText.alpha = 0.1
       storyUpdate()
       textAnimate()
       imageUpdate()
       imageAnimate()
        imageAnimate2()
       Hide()
    }
    
    func Hide() {
    if (counter == 0) {
    buttonHide.hidden = true
        
    } else {
    buttonHide.hidden = false
    }
        
    }
   //helper function for updating text
    func storyUpdate() {
        storyText.text = storyWords[counter]
    }
    
    //helper function for updating images
    func imageUpdate() {
        backgroundImages.image = backgroundCount[counter]
       
    }
    //helper function for animating story text in on update
     func textAnimate(){
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.storyText.alpha = 1
            })
        }
    
    //helper function for accessing animation images
    func imageAnimate(){
        sparkleStars1.image = animatedImages[animatedImagesStart]
       
}
    
    func imageAnimate2(){
        sparkleStars2.image = animatedImages2[animatedImagesStart2]
    }

  //function for adding an animation block for twinkling stars
    func imageAnimateIn(){
        UIView.animateWithDuration(1, delay: 1,
            options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: {
                self.sparkleStars1.alpha = 1
                self.sparkleStars2.alpha = 0.2
            }, completion: nil)
    }
    

  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

