//
//  CompanyEntity.swift
//  ContactListApp
//
//  Created by Ashley Han on 4/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

class CompanyEntity: ContactBaseModel {

    var name: String = ""
    var catchPhrase: String = ""
    var bs: String = ""
    
    var info: String {
        return "\(self.name)\n\(self.catchPhrase)\n\(self.bs)"
    }
    
    init(dict: Dictionary<String, Any>) {
        super.init()
        
        if dict.index(forKey: "name") != nil {
            if let v = dict["name"] {
                name = v as! String
            }
        }
        
        if dict.index(forKey: "catchPhrase") != nil {
            if let v = dict["catchPhrase"] {
                catchPhrase = v as! String
            }
        }
        
        if dict.index(forKey: "bs") != nil {
            if let v = dict["bs"] {
                bs = v as! String
            }
        }
    }
}
