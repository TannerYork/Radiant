//
//  API Manager.swift
//  WeatherApp
//
//  Created by Tanner York on 11/14/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct APIManager {
    enum APIErrors: Error {
        case noData
        case noResponse
        case invalidData
    }
    
    static func getWeather(at location: Location, onCompletion: @escaping (WeatherData?, Error?) -> Void) {
        
        let root = "https://api.darksky.net/forecast"
        let key = APIKeys.DarkSkyKey
        let url = "\(root)/\(key)/\(location.latitude),\(location.longitude)"
        
        Alamofire.request(url).responseJSON { response in
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                if let weatherData = WeatherData(json) {
                    onCompletion(weatherData, nil)
                } else {
                    onCompletion(nil, APIErrors.invalidData)
                }
                
            case .failure(let error):
                onCompletion(nil, error)
                
                
            }
        }
    }
    
    static func getLocation(adress: String, onCompletion: @escaping (GeoData?, Error?) -> Void) {
        
        let root = "//maps.googleapis.com/maps/api/geocode/json?address="
        let key = APIKeys.GeoCoding
        let url = root + adress + "&key" + key
        
        Alamofire.request(url).responseJSON { response in
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                if let geoData = GeoData(json) {
                    onCompletion(geoData, nil)
                } else {
                    onCompletion(nil, APIErrors.invalidData)
                }
                print(json)
            case .failure(let error):
                onCompletion(nil, error)
            }
        }
        
    }
}
