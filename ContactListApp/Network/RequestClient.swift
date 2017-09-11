//
//  RequestClient.swift
//  ContactListApp
//
//  Created by Ashley Han on 4/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

private let _sharedClient: RequestClient = RequestClient()

class RequestClient: AFHTTPSessionManager {
    
    class var sharedClient: RequestClient {
        return _sharedClient
    }
}
