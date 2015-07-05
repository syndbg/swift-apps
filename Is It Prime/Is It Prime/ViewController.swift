//
//  ViewController.swift
//  Is It Prime
//
//  Created by Anton Antonov on 7/5/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    func isPrime(number: Int) -> Bool {
        if number < 2 {
            return false
        }
        for var divisor = 2; divisor < number; divisor++ {
            if number % divisor == 0 {
                return false
            }
        }
        return true
    }

    @IBAction func buttonPressed(sender: UIButton) {
        var userInput = numberInput.text.toInt()

        if userInput == nil {
            resultLabel.text = "Enter a number"
        } else {
            var message = "\(userInput!) is "
            if isPrime(userInput!) {
                message = message.stringByAppendingString("a prime number")
            } else {
                message = message.stringByAppendingString("is not a prime number")
            }
            resultLabel.text = message
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

