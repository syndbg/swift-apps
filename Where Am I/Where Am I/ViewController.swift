//
//  ViewController.swift
//  Where Am I
//
//  Created by Anton Antonov on 7/17/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

  @IBOutlet weak var latLabel: UILabel!
  @IBOutlet weak var lotLabel: UILabel!
  @IBOutlet weak var courseLabel: UILabel!
  @IBOutlet weak var speedLabel: UILabel!
  @IBOutlet weak var altLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!

  var locManager: CLLocationManager!

  override func viewDidLoad() {
    super.viewDidLoad()
    locManager = CLLocationManager()
    locManager.delegate = self
    locManager.desiredAccuracy = kCLLocationAccuracyBest
    locManager.requestWhenInUseAuthorization()
    locManager.startUpdatingLocation()
  }

  func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    println(locations)

    var userLocation = locations[0] as! CLLocation
    latLabel.text = "\(userLocation.coordinate.latitude)"
    lotLabel.text = "\(userLocation.coordinate.longitude)"
    courseLabel.text = "\(userLocation.course)"
    speedLabel.text = "\(userLocation.speed)"
    altLabel.text = "\(userLocation.altitude)"
    setNearestAddress(userLocation)
  }

  func setNearestAddress(location: CLLocation!) {
    CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
      if error != nil {
        println(error)
      } else {
        let placemark = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark)
        if placemark != nil {
          self.addressLabel.text = "\(placemark.subAdministrativeArea)\n\(placemark.postalCode)\n\(placemark.country)"
        }
      }
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  
}

