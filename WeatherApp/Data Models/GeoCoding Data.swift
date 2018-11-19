//
//  GeoCoding Data.swift
//  WeatherApp
//
//  Created by Tanner York on 11/19/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GeoData {
    enum GeoDataKeys: String {
        case results = "results"
        case formatteddress = "formatted_address"
        case geometry = "geometry"
        case location = "location"
        case latitude = "lat"
        case longitude = "lng"
    }
    
    let formattedAdress: String
    let latitude: Double
    let longitude: Double
    
    init(formattedAdress: String, latitude: Double, longitude: Double) {
        self.formattedAdress = formattedAdress
        self.latitude = latitude
        self.longitude = longitude
    }
    
    convenience init? (_ json: JSON) {
        let location = json[GeoDataKeys.results.rawValue][0][GeoDataKeys.geometry.rawValue][GeoDataKeys.location.rawValue]
        
        guard let results = json[GeoDataKeys.results.rawValue].array, results.count > 0 else {return nil}
        guard let formatted = location[GeoDataKeys.formatteddress.rawValue].string,
              let latitude = location[GeoDataKeys.latitude.rawValue].double,
              let longitude = location[GeoDataKeys.longitude.rawValue].double else {
                print("Error getting GeoData")
                return nil
        }
        self.init(formattedAdress: formatted, latitude: latitude, longitude: longitude)
    }
    
}
