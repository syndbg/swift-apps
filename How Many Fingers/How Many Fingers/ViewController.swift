//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Anton Antonov on 7/5/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var answerLabel: UILabel!

    @IBAction func buttonPressed(sender: AnyObject) {
        let correctAnswer = arc4random_uniform(5)
        let userAnswer = ageInput.text.toInt()

        if userAnswer == nil {
            answerLabel.text = "Enter a number between 0 - 5"
        } else {
            if Int(correctAnswer) == userAnswer {
                answerLabel.text = "Correct!"
            } else {
                answerLabel.text = "Incorrect! Answer was \(correctAnswer)"
            }
        }
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

