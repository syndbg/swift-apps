//
//  ViewController.swift
//  Cat Years
//
//  Created by Anton Antonov on 7/4/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var yearsInput: UITextField!
    @IBOutlet var yearsLabel: UILabel!

    @IBAction func buttonPressed(sender: UIButton) {
        var enteredAge = yearsInput.text.toInt()

        if enteredAge != nil {
            var labelAge = enteredAge! * 7
            yearsLabel.text = "Your cat is \(labelAge) in cat years"
        } else {
            yearsLabel.text = "Enter a whole number!"
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

