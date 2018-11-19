//
//  Weather Data.swift
//  WeatherApp
//
//  Created by Tanner York on 11/16/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherData {
    enum Condition: String {
        case clearDay = "clear-day"
        case clearNight = "clear-night"
        case rain = "rain"
        case snow = "snow"
        case sleet = "sleet"
        case wind = "wind"
        case fog = "fog"
        case cloudy = "cloudy"
        case partlyCloudyDay = "partly-cloudy-day"
        case partlyCloudyNight = "partly-cloudy-night"
        
        var icon: String {
            switch self {
            case .clearDay:
                return "☀️"
            case .clearNight:
                return "🌑"
            case .rain:
                return "🌧"
            case .snow:
                return "🌨"
            case .sleet:
                return "🌨"
            case .wind:
                return "💨"
            case .fog:
                return "🌁"
            case .cloudy:
                return "☁️"
            case .partlyCloudyDay:
                return "🌤"
            case .partlyCloudyNight:
                return "☁️🌑"
            }
        }
    }
    enum WeatherDataKeys: String {
        case currently = "currently"
        case temperature = "temperature"
        case summary = "summary"
        case icon = "icon"
        case daily = "daily"
        case data = "data"
        case temperatureHigh = "temperatureHigh"
        case temperatureLow = "temperatureLow"
    }
    
    let temperature: Double
    let highTemperature: Double
    let lowTemperature: Double
    let condition: Condition
    let summary: String
    
    //Designated initilizer
    init(temperature: Double, summary: String, highTemperature: Double, lowTemperature: Double, condition: Condition) {
        self.temperature = temperature
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
        self.condition = condition
        self.summary = summary
    }
    
    convenience init? (_ json: JSON) {
        let daily = json[WeatherDataKeys.daily.rawValue]
        let currently = json[WeatherDataKeys.currently.rawValue]
        let data = WeatherDataKeys.data.rawValue
        
        guard let temperature = currently[WeatherDataKeys.temperature.rawValue].double else {
            print("Error getting temp")
            return nil
        }
        guard  let highTemperature = daily[data][0][WeatherDataKeys.temperatureHigh.rawValue].double else {
            print("Error getting high temp")
            return nil
        }
        guard  let lowTemperature = daily[data][0][WeatherDataKeys.temperatureLow.rawValue].double else {
            print("Error getting low temp")
            return nil
        }
        guard  let condition = currently[WeatherDataKeys.icon.rawValue].string else {
            print("Error getting condition")
            return nil
        }
        guard let summary = currently[WeatherDataKeys.summary.rawValue].string else {
                print("Did not set data")
                return nil
        }
        self.init(temperature: temperature, summary: summary, highTemperature: highTemperature, lowTemperature: lowTemperature, condition: (WeatherData.Condition(rawValue: condition)!))
    }
    
    
    
}
