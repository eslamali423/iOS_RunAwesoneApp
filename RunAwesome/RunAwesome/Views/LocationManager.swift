//
//  LocationManager.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 24/04/2022.
//

import Foundation
import CoreLocation

final class LocationManager {
    
    var manager  : CLLocationManager
    
    init() {
        manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.activityType  = .fitness
        
    }
    
    
    func checkLocationAuthorization(){
        if manager.authorizationStatus != .authorizedWhenInUse {
            manager.requestWhenInUseAuthorization()
        }
    }
    
}
