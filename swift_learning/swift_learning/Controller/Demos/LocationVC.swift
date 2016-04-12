//
//  LocationVC.swift
//  swift_learning
//
//  Created by 张成龙 on 16/4/6.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

import UIKit
import CoreLocation

class LocationVC: UIViewController {

    @IBOutlet weak var longitude: UILabel!
    
    @IBOutlet weak var latitude: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var speed: UILabel!
    
    @IBOutlet weak var course: UILabel!
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }

}

extension LocationVC: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
//        self.speed.text = (String)((manager.location?.speed)!)
        self.course.text = (String)(newHeading.trueHeading)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let coord =  manager.location?.coordinate
        self.longitude.text = String(format: "%lf", arguments: [(coord?.longitude)!])
        self.latitude.text = (String)((coord?.latitude)!)
        self.speed.text = (String)((manager.location?.speed)!)
//        self.course.text = (String)((manager.location?.course)!)
        
        
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placeMarks:[CLPlacemark]?, error:NSError?) in
            
            if error != nil {
                self.addressLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            
            if placeMarks?.count > 0 {
                let placeMark = placeMarks![0]
                
                self.displayAddressWith(placeMark)
            } else {
                self.addressLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
            }
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        self.addressLabel.text = error.localizedDescription
    }
    
    func displayAddressWith(placeMark: CLPlacemark?) {
        
        if let pm = placeMark {
            
            let name = (pm.name != nil) ? pm.name!:"*"
            let thoroughfare = (pm.thoroughfare != nil) ? pm.thoroughfare!:"*"
            let subThoroughfare = (pm.subThoroughfare != nil) ? pm.subThoroughfare!:"*"
            let locality = (pm.locality != nil) ? pm.locality!:"*"
            let subLocality = (pm.subLocality != nil) ? pm.subLocality!:"*"
            let administrativeArea = (pm.administrativeArea != nil) ? pm.administrativeArea!:"*"
            let postalCode = (pm.postalCode != nil) ? pm.postalCode!:"*"
            let ISOcountryCode = (pm.ISOcountryCode != nil) ? pm.ISOcountryCode!:"*"
            let country = (pm.country != nil) ? pm.country!:"*"
            let inlandWater = (pm.inlandWater != nil) ? pm.inlandWater!:"*"
            let ocean = (pm.ocean != nil) ? pm.ocean!:"*"
//            let areasOfInterest = (pm.areasOfInterest != nil) ? pm.areasOfInterest! : []

            self.addressLabel.text = name + thoroughfare + subThoroughfare + locality + subLocality + administrativeArea + postalCode + ISOcountryCode + country + inlandWater + ocean
        }
        
    }
}
