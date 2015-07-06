//
//  ViewController.swift
//  Stopwatch
//
//  Created by Anton Antonov on 7/5/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = NSTimer()
    var count = 0

    func countTime() {
        count++
        time.text = "\(count)"
    }

    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var time: UILabel!
    @IBAction func stopButtonPressed(sender: UIBarButtonItem) {
        time.text = "0"
        timer.invalidate()
        changeRightButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "playButtonPressed:"))
    }

    @IBAction func pauseButtonPressed(sender: UIBarButtonItem) {
        timer.invalidate()
        changeRightButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "playButtonPressed:"))
    }

    func changeRightButton(newButton: UIBarButtonItem) -> Void {
        var toolbarItems = toolbar.items
        toolbarItems?.removeLast()
        toolbarItems?.append(newButton)
        toolbar.setItems(toolbarItems, animated: true)
    }

    @IBAction func playButtonPressed(sender: UIBarButtonItem) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("countTime"), userInfo: nil, repeats: true)
        changeRightButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "pauseButtonPressed:"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

