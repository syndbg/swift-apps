//
//  ViewController.swift
//  Persistent Storage
//
//  Created by Anton Antonov on 7/8/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSUserDefaults.standardUserDefaults().setObject("John", forKey: "name")
        var name = NSUserDefaults.standardUserDefaults().objectForKey("name") as! String
        println(name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

