//
//  LocationTBC.swift
//  WeatherApp
//
//  Created by Tanner York on 11/17/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class LocationTVC: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var locationIcon: UILabel!
    @IBOutlet weak var locationName: UILabel!
    var latitude = Double()
    var longitude = Double()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Actions
    func setUpCell(_ location: Location) {
//        locationName.text = location.name
        latitude = location.latitude
        longitude = location.longitude
    }

}
