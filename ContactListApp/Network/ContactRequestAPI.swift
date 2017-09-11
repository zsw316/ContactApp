//
//  ContactRequestAPI.swift
//  ContactListApp
//
//  Created by Ashley Han on 4/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

typealias FinishHandler = (NSArray?, Error?)->Void

class ContactRequestAPI: RequestAPI {

    class func fetchContacts(finish: @escaping FinishHandler) -> Void
    {
        let url: String = "https://jsonplaceholder.typicode.com/users"
        setResponseSerializer(serializer: AFJSONResponseSerializer())
        
        doRequest(url: url, body: nil, succedHandler: { (task: URLSessionDataTask, responseObject: Any?) in
            finish(responseObject as? NSArray, nil)
        }, failedHandler: { (task: URLSessionDataTask?, error:Error) in
            finish(nil, error)
        })
    }
}
