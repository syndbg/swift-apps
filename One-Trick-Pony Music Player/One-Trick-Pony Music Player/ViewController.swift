//
//  ViewController.swift
//  One-Trick-Pony Music Player
//
//  Created by Anton Antonov on 7/20/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var timer = NSTimer()

  @IBOutlet weak var progressSlider: UISlider!
  @IBOutlet weak var toolbar: UIToolbar!

  @IBAction func playPressed(sender: UIBarButtonItem) {
    progressSlider.maximumValue = Float(audioPlayer.duration)
    play()
  }

  func play() {
    audioPlayer.play()
    startUpdatingProgress()
    changeLeftButton(createPauseButton())
  }

  @IBAction func pausePressed(sender: UIBarButtonItem) {
    audioPlayer.pause()
    timer.invalidate()
    changeLeftButton(createPlayButton())
  }

  @IBAction func seekAudio(sender: UISlider) {
    if audioPlayer.playing {
      audioPlayer.pause()
      audioPlayer.currentTime = NSTimeInterval(progressSlider.value)
      play()
    } else {
      progressSlider.maximumValue = Float(audioPlayer.duration)
      audioPlayer.currentTime = NSTimeInterval(progressSlider.value)
    }

  }

  func createPauseButton() -> UIBarButtonItem {
    return UIBarButtonItem(barButtonSystemItem: .Pause, target: self, action: "pausePressed:")
  }

  func createPlayButton() -> UIBarButtonItem {
    return UIBarButtonItem(barButtonSystemItem: .Play, target: self, action: "playPressed:")
  }

  @IBAction func stopPressed(sender: UIBarButtonItem) {
    audioPlayer.stop()
    audioPlayer.currentTime = 0
    changeLeftButton(createPlayButton())
  }

  func updateProgress() {
    progressSlider.value = Float(audioPlayer.currentTime)
  }

  func startUpdatingProgress() {
    timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("updateProgress"), userInfo: nil, repeats: true)
  }

  func changeLeftButton(newButton: UIBarButtonItem) -> Void {
    var toolbarItems = toolbar.items
    toolbarItems?.removeLast()
    toolbarItems?.append(newButton)
    toolbar.setItems(toolbarItems, animated: true)
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

