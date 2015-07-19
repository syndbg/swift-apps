//
//  ViewController.swift
//  Memorable Places
//
//  Created by Anton Antonov on 7/18/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

  var manager: CLLocationManager!

  @IBOutlet var map: MKMapView!

  override func viewDidLoad() {
    super.viewDidLoad() 

    manager = CLLocationManager()
    manager.delegate = self
    manager.desiredAccuracy = kCLLocationAccuracyBest

    if currentPlace == -1 {
      manager.requestWhenInUseAuthorization()
      manager.startUpdatingLocation()
    } else {
      setAnnotation()
    }

    var uiLongPressRecognizer = UILongPressGestureRecognizer(target: self, action: "addAnotation:")
    uiLongPressRecognizer.minimumPressDuration = 2.0
    map.addGestureRecognizer(uiLongPressRecognizer)
  }

  func setAnnotation() {
    let latitude = NSString(string: places[currentPlace]["lat"]!).doubleValue
    let longitude = NSString(string: places[currentPlace]["lon"]!).doubleValue

    var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
    var latDelta:CLLocationDegrees = 0.01
    var lonDelta:CLLocationDegrees = 0.01
    var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
    var region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
    map.setRegion(region, animated: true)

    var annotation = MKPointAnnotation()
    annotation.coordinate = coordinate
    annotation.title = places[currentPlace]["title"]
    map.addAnnotation(annotation)
  }

  func addAnotation(gestureRecognizer: UIGestureRecognizer) {
    if gestureRecognizer.state == UIGestureRecognizerState.Began {
      let touchPoint = gestureRecognizer.locationInView(map)
      let newCoordinate = map.convertPoint(touchPoint, toCoordinateFromView: map)
      let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)

      CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
        var title = ""

        if (error == nil) {
          if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark) {
            var subThoroughfare:String = ""
            var thoroughfare:String = ""

            if p.subThoroughfare != nil {
              subThoroughfare = p.subThoroughfare
            }

            if p.thoroughfare != nil {
              thoroughfare = p.thoroughfare
            }

            title = "\(subThoroughfare) \(thoroughfare)"
          }

        }

        if title == "" {
          title = "Added \(NSDate())"
        }

        places.append(["title": title, "lat": "\(newCoordinate.latitude)", "lon": "\(newCoordinate.longitude)"])
        NSUserDefaults.standardUserDefaults().setValue(places, forKey: "places")

        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = title
        self.map.addAnnotation(annotation)
      })
    }
  }

  func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    let userLocation:CLLocation! = locations[0] as! CLLocation
    updateRegion(userLocation)
  }

  func updateRegion(location: CLLocation) {
    let latitude = location.coordinate.latitude
    let longitude = location.coordinate.longitude
    let latDelta:CLLocationDegrees = 0.01
    let lonDelta:CLLocationDegrees = 0.01

    let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
    let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
    let region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
    map.setRegion(region, animated: true)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

