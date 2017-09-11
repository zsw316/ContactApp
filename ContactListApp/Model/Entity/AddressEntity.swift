//
//  AddressEntity.swift
//  ContactListApp
//
//  Created by Ashley Han on 4/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

struct Geo {
    let lat = ""
    let lng = ""
}

class AddressEntity: ContactBaseModel {

    var suite: String = ""
    var street: String = ""
    var city: String = ""
    var zipcode: String = ""
    let geo: Geo = Geo()
        
    var info: String {
        return "\(self.suite) \(self.street)\n\(self.city), \(self.zipcode)"
    }
    
    init(dict: Dictionary<String, Any>) {
        super.init()
        
        if dict.index(forKey: "suite") != nil {
            if let v = dict["suite"] {
                suite = v as! String
            }
        }
        
        if dict.index(forKey: "street") != nil {
            if let v = dict["street"] {
                street = v as! String
            }
        }
        
        if dict.index(forKey: "city") != nil {
            if let v = dict["city"] {
                city = v as! String
            }
        }
        
        if dict.index(forKey: "zipcode") != nil {
            if let v = dict["zipcode"] {
                zipcode = v as! String
            }
        }
    }
}
