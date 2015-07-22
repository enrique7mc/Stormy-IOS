//
//  NetworkOperation.swift
//  Stormy
//
//  Created by admin on 22/07/15.
//  Copyright (c) 2015 enrique7mc. All rights reserved.
//

import Foundation

class NetworkOperation {
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURL: NSURL
    
    init(url: NSURL) {
        queryURL = url
    }
}