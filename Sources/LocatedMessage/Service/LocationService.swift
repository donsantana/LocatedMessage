//
//  File.swift
//  
//
//  Created by Done Santana on 7/11/24.
//

import Foundation
import CoreLocation
import UIKit
import Observation

@Observable class LocationService: NSObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    var locationCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("UpdateLocation")
        guard let coordinates = locations.last?.coordinate else {return}
        locationCoordinate = coordinates
    }
}
