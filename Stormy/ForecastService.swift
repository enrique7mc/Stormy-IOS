//
//  ForecastService.swift
//  Stormy
//
//  Created by admin on 22/07/15.
//  Copyright (c) 2015 enrique7mc. All rights reserved.
//

import Foundation

struct ForecastService {
    let forecastAPIKey: String
    let forecastBaseURL: NSURL?
    
    init(APIKey: String) {
        forecastAPIKey = APIKey
        forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
    }
    
    func getForecast(lat: Double, long: Double, completion: (CurrentWeather? -> Void)) {
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL) {
            let networkOperation = NetworkOperation(url: forecastURL)
            networkOperation.downloadJSONFromURL {
                (let JSONDictonary) in
                let currentWeather = self.currentWeatherFromJSONDictonary(JSONDictonary)
                completion(currentWeather)
            }
        } else {
            println("Could not construct a valid URL")
        }
    }
    
    func currentWeatherFromJSONDictonary(jsonDictonary: [String: AnyObject]?) -> CurrentWeather? {
        if let currentWeatherDictionary = jsonDictonary?["currently"] as? [String: AnyObject] {
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
        } else {
            println("JSON dictonary returned nil for 'currently' key")
            return nil
        }
    }
}