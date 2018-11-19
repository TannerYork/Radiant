//
//  HomeVC.swift
//  WeatherApp
//
//  Created by Tanner York on 11/14/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//@objc protocol HomeVCDelegate {
//    @objc optional func toggleLeftPanel()
//    @objc optional func toggleRightPanel()
//    @objc optional func collapseSidePanels()
//}

class HomeVC: UIViewController {
    
    @IBOutlet var HomeView: UIView!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var TempLabel: UILabel!
    @IBOutlet weak var SummeryLabel: UILabel!
    @IBOutlet weak var weatherIconLable: UILabel!
    
    //    var delegate: HomeVCDelegate?
    var displayWeatherData: WeatherData! {
        didSet {
            LocationLabel.text = "Glasgow"
            timeLabel.text = "12:00"
            TempLabel.text = "\(displayWeatherData.lowTemperature)º/\(displayWeatherData.highTemperature)º"
            SummeryLabel.text = displayWeatherData.summary
            weatherIconLable.text = displayWeatherData.condition.icon
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        APIManager.getWeather(at: Location(latitude: 37.8267, longitude: -122.4233)) { (weatherData, error) in
            if let receivedData = weatherData {
                self.displayWeatherData = receivedData
                
            } 
            
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }
}


