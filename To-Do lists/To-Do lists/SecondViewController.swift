//
//  SecondViewController.swift
//  To-Do lists
//
//  Created by Anton Antonov on 7/10/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var itemName: UITextField!
    @IBAction func buttonPressed(sender: AnyObject) {
        let text = itemName.text
        if text != nil {
            toDoItems.append(text)
            itemName.text = ""  
            NSUserDefaults.standardUserDefaults().setObject(toDoItems, forKey: "toDoItems")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemName.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}

