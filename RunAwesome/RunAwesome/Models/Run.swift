//
//  Run.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 30/04/2022.
//

import Foundation
import RealmSwift


final class Run : Object {
    
    @objc dynamic public private(set) var id = UUID().uuidString.lowercased()
    @objc dynamic public private(set) var pace = 0
    @objc dynamic public private(set) var distance = 0.0
    @objc dynamic public private(set) var duration = 0
    @objc dynamic public private(set) var date = Date()
    
    
    public private(set) var locations = List<Location>()
    
    
    
}
