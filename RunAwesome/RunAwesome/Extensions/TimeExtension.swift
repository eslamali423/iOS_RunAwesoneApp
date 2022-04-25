//
//  TimeExtension.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 25/04/2022.
//

import Foundation

extension Int {
    func formatTimeString() -> String {
       let hours = self / 3600
        let minutes =  ( self % 3600 ) / 60
        let seconds = ( self % 3600 ) % 60
        
        
        if seconds < 0 {
            return "00:00:00"
        }else if hours  == 0 {
            return String(format: "%2d:%2d", minutes,seconds)
        } else {
            return String(format: "%2d:%2d:%2d", hours,minutes,seconds)
        }
    }
    
    
}
