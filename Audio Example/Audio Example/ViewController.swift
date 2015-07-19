//
//  ViewController.swift
//  Audio Example
//
//  Created by Anton Antonov on 7/19/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit
import AVFoundation

var player = AVAudioPlayer()
var error: NSError? = nil

class ViewController: UIViewController {
  @IBAction func play(sender: AnyObject) {
    if error != nil {
      println(error)
    } else {
      player.play()
    }
  }

  @IBAction func pause(sender: AnyObject) {
    player.pause()
  }

  @IBAction func volumeChanged(sender: UISlider) {
    player.volume = sender.value
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

