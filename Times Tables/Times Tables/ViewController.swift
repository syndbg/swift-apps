//
//  ViewController.swift
//  Times Tables
//
//  Created by Anton Antonov on 7/8/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var sliderValue: UISlider!

    @IBOutlet weak var table: UITableView!

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        let timesTable = Int(sliderValue.value * 20)

        cell.textLabel?.text = String(timesTable * (indexPath.row + 1))
        return cell
    }

    @IBAction func sliderMoved(sender: UISlider) {
        table.reloadData()
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

