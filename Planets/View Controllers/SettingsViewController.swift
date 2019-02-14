//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var planetController: PlanetController!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    @IBAction func changeShouldShowPluto(_ sender: UISwitch) {
        //let userDefaults = UserDefaults.standard
        //userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
        planetController.shouldShowPluto = sender.isOn
    }
    
    private func updateViews() {
        //let userDefaults = UserDefaults.standard
        //shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
        shouldShowPlutoSwitch.isOn = planetController.shouldShowPluto
    }
    
    @IBOutlet weak var shouldShowPlutoSwitch: UISwitch!
}
