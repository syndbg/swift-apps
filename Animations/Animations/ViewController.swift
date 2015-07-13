//
//  ViewController.swift
//  Animations
//
//  Created by Anton Antonov on 7/12/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var frameNumber = 1
  var timer = NSTimer()

  @IBOutlet weak var image: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
      
    timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: <#Selector#>("performAnimation"), userInfo: nil, repeats: true)

    // image.alpha = 0
  }

  func performAnimation() {
    if frameNumber == 5 {
      frameNumber = 1
    } else {
      frameNumber++
    }
    image.image = UIImage(named: "frame\(frameNumber).png")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  /* fade slide in animation
  override func viewDidLayoutSubviews() {
    // hide it from the screen
    image.center = CGPointMake(image.center.x - 400, image.center.y)
  }

  override func viewDidAppear(animated: Bool) {
    UIView.animateWithDuration(1, animations: { () -> Void in
      self.image.alpha = 1
      self.image.center = CGPointMake(self.image.center.x + 400, self.image.center.y)
    })
  }

  */
}

