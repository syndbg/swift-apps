//
//  FirstViewController.swift
//  To-Do lists
//
//  Created by Anton Antonov on 7/10/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

var toDoItems = [String]()

class FirstViewController: UIViewController, UITableViewDelegate
{

    @IBOutlet weak var itemsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if (NSUserDefaults.standardUserDefaults().objectForKey("toDoItems") != nil) {
            toDoItems = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems") as! [String]
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        itemsTable.reloadData()
    }

    // table rows and table prototype content
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoItems[indexPath.row]
        return cell
    }

    // table swipe to delete
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            toDoItems.removeAtIndex(indexPath.item)
            NSUserDefaults.standardUserDefaults().setObject(toDoItems, forKey: "toDoItems")
            itemsTable.reloadData()
        }
    }
}

