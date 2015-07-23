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
    typealias JSONDictionaryCompletion =  ([String: AnyObject]? -> Void)
    
    init(url: NSURL) {
        queryURL = url
    }
    
    func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
        let request: NSURLRequest = NSURLRequest(URL: queryURL)
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            
            if let httpResponse = response as? NSHTTPURLResponse {
                switch(httpResponse.statusCode) {
                    case 200:
                        let jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? [String: AnyObject]
                        completion(jsonDictionary)
                    default:
                    println("GET not successful http status code \(httpResponse.statusCode)")
                }
            } else {
                println("Error: Not a valid http response")
            }
        }
        
        dataTask.resume()
    }
}