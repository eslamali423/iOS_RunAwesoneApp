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
    
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    override class func indexedProperties() -> [String] {
        return  [ "pace" , "date", "duration"]
    }
    
    
    convenience init(pace : Int, distance : Double, duration: Int, locations: List<Location>) {
        self.init()
        self.date = Date()
        self.pace = pace
        self.duration = duration
        self.distance = distance
        self.locations = locations
    }
    
    static func addRunToRealmpace (pace: Int, distance : Double, duration: Int, locations: List<Location>){
        Constant.realmQueue.sync {
            do {
             let realm =  try Realm()
                try realm.write({
                    realm.add(Run(pace: pace, distance: distance, duration: duration, locations: locations))
                    try realm.commitWrite()
                })
            } catch {
                print("Cant store data to realm database")
            }
        }
    }
    
    static func getAllRuns() ->  Results<Run>?  {
        do {
         let realm =  try Realm()
            var runCollection = realm.objects(Run.self)
            runCollection = runCollection.sorted(byKeyPath: "date", ascending: false)
            return runCollection
        } catch {
           return nil
        }
    }
    
    
}
