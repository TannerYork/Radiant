//
//  MenuViewController.swift
//  WeatherApp
//
//  Created by Tanner York on 11/17/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class MenuVC: UINavigationController {

    @IBOutlet weak var locationsTableView: UITableView!
    var locations = Locations.shared.locations
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeMenu(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

}

extension MenuVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Locations.shared.locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LocationTVC
        let location = locations[indexPath.row]
        cell.setUpCell(location)
        return cell
    }

    
}
