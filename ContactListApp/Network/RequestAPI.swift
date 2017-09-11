//
//  RequestAPI.swift
//  ContactListApp
//
//  Created by Ashley Han on 4/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

typealias SucceedHandler = (URLSessionDataTask,Any?)->Void

typealias FailedHandler = (URLSessionDataTask?,Error)->Void

class RequestAPI: NSObject
{
    class func doRequest(url:String!,body:AnyObject?,succedHandler:@escaping SucceedHandler,failedHandler:@escaping FailedHandler)
    {
        RequestClient.sharedClient.get(url,
                                       parameters: body,
                                       progress: nil,
                                       success: { (task: URLSessionDataTask, responseObject: Any?) in
            succedHandler(task,responseObject)
        },
                                       failure: { (task: URLSessionDataTask?, error:Error) in
            failedHandler(task!, error)
        })
    }
    
    class func setResponseSerializer(serializer: AFHTTPResponseSerializer)
    {
        RequestClient.sharedClient.responseSerializer = serializer
    }
}
