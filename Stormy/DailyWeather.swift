//
//  DailyWeather.swift
//  Stormy
//
//  Created by admin on 03/08/15.
//  Copyright (c) 2015 enrique7mc. All rights reserved.
//

import Foundation
import UIKit

struct DailyWeather {
    let maxTemperature: Int?
    let minTemperature: Int?
    let humidity: Int?
    let precipChance: Int?
    let summary: String?
    var icon: UIImage? = UIImage(named: "default.png")
    var largeIcon: UIImage? = UIImage(named: "default_large.png")
    let sunriseTime: String?
    let sunsetTime: String?
    let day: String?
    static let dateFormatter = NSDateFormatter()
    
    init(dailyWeatherDictionary: [String: AnyObject]) {
        maxTemperature = dailyWeatherDictionary["temperatureMax"] as? Int
        minTemperature = dailyWeatherDictionary["temperatureMin"] as? Int
        
        if let temperatureFloat = dailyWeatherDictionary["humidity"] as? Double {
            humidity = Int(temperatureFloat * 100)
        } else {
            humidity = nil
        }
        
        if let precipChanceFloat = dailyWeatherDictionary["precipProbability"] as? Double {
            precipChance = Int(precipChanceFloat * 100)
        } else {
            precipChance = nil
        }
        
        summary = dailyWeatherDictionary["summary"] as? String
        if let iconString = dailyWeatherDictionary["icon"] as? String,
            let iconEnum = Icon(rawValue: iconString) {
            (icon, largeIcon) = iconEnum.toImage()
        }
        
        if let sunriseDate = dailyWeatherDictionary["sunriseTime"] as? Double {
            sunriseTime = DailyWeather.timeStringFromUnixTime(sunriseDate)
        } else {
            sunriseTime = nil
        }
        
        if let sunsetDate = dailyWeatherDictionary["sunsetTime"] as? Double {
            sunsetTime = DailyWeather.timeStringFromUnixTime(sunsetDate)
        } else {
            sunsetTime = nil
        }
        
        if let time = dailyWeatherDictionary["time"] as? Double {
            day = DailyWeather.dayStringFromUnixTime(time)
        } else {
            day = nil
        }
    }
    
    static func timeStringFromUnixTime(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.stringFromDate(date)
    }
    
    static func dayStringFromUnixTime(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        dateFormatter.locale = NSLocale(localeIdentifier: NSLocale.currentLocale().localeIdentifier)
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.stringFromDate(date)
    }
}