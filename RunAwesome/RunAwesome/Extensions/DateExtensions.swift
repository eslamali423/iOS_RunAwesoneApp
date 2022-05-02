//
//  DateExtensions.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 02/05/2022.
//

import Foundation


extension Date {
    func getDateString() -> String {
        let calender =  Calendar.current
        let year = calender.component(.year, from: self)
        let month = calender.component(.month, from: self)
        let day = calender.component(.day, from: self)
        
        
        return "\(month)/\(day)/\(year)"
    }
}
