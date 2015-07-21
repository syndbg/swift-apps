//
//  ViewController.swift
//  Gestures example
//
//  Created by Anton Antonov on 7/20/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
    if !audioPlayer.playing && event.subtype == UIEventSubtype.MotionShake {
      audioPlayer.play()
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

