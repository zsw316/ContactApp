//
//  ContactEntity.swift
//  ContactListApp
//
//  Created by Ashley Han on 4/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

class ContactEntity: ContactBaseModel {

    var id: Int = 0
    
    var name: String = ""
    
    var email: String = ""
    
    var username: String = ""
    
    var phone: String = ""
    
    var address: AddressEntity!
    
    var website: String = ""
    
    var company: CompanyEntity!
    
    
    
    init(dict: Dictionary<String, Any>) {
        super.init()
        
        if dict.index(forKey: "id") != nil {
            if let v = dict["id"] {
                id = v as! Int
            }
        }
        
        if dict.index(forKey: "name") != nil {
            if let v = dict["name"] {
                name = v as! String
            }
        }
        
        if dict.index(forKey: "email") != nil {
            if let v = dict["email"] {
                email = v as! String
            }
        }
        
        if dict.index(forKey: "username") != nil {
            if let v = dict["username"] {
                username = v as! String
            }
        }
        
        if dict.index(forKey: "phone") != nil {
            if let v = dict["phone"] {
                phone = v as! String
            }
        }
        
        if dict.index(forKey: "website") != nil {
            if let v = dict["website"] {
                website = v as! String
            }
        }
        
        if dict.index(forKey: "address") != nil {
            if let addressDict = dict["address"] {
                address = AddressEntity(dict: addressDict as! Dictionary<String, Any>)
            }
        }
        
        if dict.index(forKey: "company") != nil {
            if let companyDict = dict["company"] {
                company = CompanyEntity(dict: companyDict as! Dictionary<String, Any>)
            }
        }
    }
}
