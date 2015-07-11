//
//  ViewController.swift
//  Web Content
//
//  Created by Anton Antonov on 7/11/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var webView: UIWebView!
  override func viewDidLoad() {
    super.viewDidLoad()
    let url = NSURL(string: "http://www.stackoverflow.com")
    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
      (data, response, error) in
      if error == nil {
        let urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) as! String

          dispatch_async(dispatch_get_main_queue()) {
          self.webView.loadHTMLString(urlContent, baseURL: nil)
        }
      } else {
        println("Got Error: \(error)")
      }
    }
    task.resume()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

