//
//  Location.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 30/04/2022.
//

import Foundation
import RealmSwift

final class Location :Object {
    
    @objc dynamic public private(set) var latiude = 0.0
    @objc dynamic public private(set) var longtude = 0.0
    
    convenience init(lat : Double, long: Double) {
        self.init()
        
        self.latiude = lat
        self.longtude = long
    }
}
