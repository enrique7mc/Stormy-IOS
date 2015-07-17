//
//  ViewController.swift
//  Stormy
//
//  Created by admin on 17/07/15.
//  Copyright (c) 2015 enrique7mc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let plistPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"),
            let weatherDictionary = NSDictionary(contentsOfFile: plistPath),
            let currentWeatherDictionary = weatherDictionary["currently"] as? [String: AnyObject]{
            
            let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
        }
        
        if let plistPath = NSBundle.mainBundle().pathForResource("CrazyInformation", ofType: "plist"),
            let weatherDictionary = NSDictionary(contentsOfFile: plistPath){
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

