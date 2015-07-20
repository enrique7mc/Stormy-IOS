//
//  CurrentWeather.swift
//  Stormy
//
//  Created by admin on 17/07/15.
//  Copyright (c) 2015 enrique7mc. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let temperature: Int
    let humidity: Int
    let precipProbability: Int
    let summary: String
    
    init(weatherDictionary: [String: AnyObject]) {
        temperature = weatherDictionary["temperature"] as! Int
        let humidityDoble = weatherDictionary["humidity"] as! Double
        humidity = Int(humidityDoble * 100)
        let precipFloat = weatherDictionary["precipProbability"] as! Double
        precipProbability = Int(precipFloat * 100)
        summary = weatherDictionary["summary"] as! String
    }
}
