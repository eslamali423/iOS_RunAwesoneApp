//
//  DistanceExtension .swift
//  RunAwesome
//
//  Created by Eslam Ali  on 26/04/2022.
//

import Foundation

extension Double {
    
    func metersToMiles () ->Double {
        let meters = Measurement(value: self, unit: UnitLength.meters)
        return meters.converted(to: .miles).value
    }
    
    
    func toString (palces : Int) -> String {
        return String(format: "%.\(palces)f", self)
    }
}
