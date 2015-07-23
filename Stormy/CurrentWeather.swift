//
//  CurrentWeather.swift
//  Stormy
//
//  Created by admin on 17/07/15.
//  Copyright (c) 2015 enrique7mc. All rights reserved.
//

import Foundation
import UIKit

enum Icon: String {
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"
}

struct CurrentWeather {
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    var icon: UIImage? = UIImage(named: "default.png")
    
    init(weatherDictionary: [String: AnyObject]) {
        temperature = weatherDictionary["temperature"] as? Int
        
        if let humidityDoble = weatherDictionary["humidity"] as? Double {
            humidity = Int(humidityDoble * 100)
        } else {
            humidity = nil
        }
        
        if let precipFloat = weatherDictionary["precipProbability"] as? Double {
            precipProbability = Int(precipFloat * 100)
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary["summary"] as? String
        
        if let iconString = weatherDictionary["icon"] as? String {
            icon = weatherImageFromIconString(iconString)
        }
    }
    
    func weatherImageFromIconString(iconString: String) -> UIImage? {
        var imageName: String
        
        if let iconValue = Icon(rawValue: iconString) {
            imageName = iconString + ".png"
        } else {
            imageName = "default.png"
        }
        
        return UIImage(named: imageName)
    }
}
