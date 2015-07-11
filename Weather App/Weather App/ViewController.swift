//
//  ViewController.swift
//  Weather App
//
//  Created by Anton Antonov on 7/11/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  @IBOutlet weak var location: UITextField!
  @IBOutlet weak var forecastLabel: UILabel!

  @IBAction func getForecast(sender: UIButton) {
    if location.text != nil {
      let searchLocation = location.text.stringByReplacingOccurrencesOfString(" ", withString: "-")
      let url = NSURL(string: "http://www.weather-forecast.com/locations/\(searchLocation)/forecasts/latest")
      if url != nil {
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
          var urlError = false
          var forecastResult = ""

          if error == nil {
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) as NSString!
            var urlContentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">")

            if urlContentArray.count > 0 {
              var forecastResultArray = urlContentArray[1].componentsSeparatedByString("</span>")
              forecastResult = forecastResultArray[0] as! String
              forecastResult = forecastResult.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
            } else {
              urlError = true
            }
          } else {
            urlError = true
          }

          dispatch_async(dispatch_get_main_queue()) {
            if urlError == true {
              self.showLocationError()
            } else {
              self.forecastLabel.text = forecastResult
            }
          }
        })

        task.resume()
      } else {
        showLocationError()
      }
    }
  }

  func showLocationError() {
    forecastLabel.text = "Could not find location info. Is it a valid city name?"
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    self.location.delegate = self
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

