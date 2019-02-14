//
//  PlanetDetailViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 9/20/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        guard let planet = planet, isViewLoaded else {
            imageView?.image = nil
            label?.text = nil
            return
        }
        
        imageView.image = planet.image
        label.text = planet.name
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        guard let planet = planet else { return }
        coder.encode(planet.name, forKey: "planetName")
        coder.encode(planet.imageName, forKey: "planetImageName")
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        let optionalPlanetName = coder.decodeObject(forKey: "planetName") as? String
        let optionalImageName = coder.decodeObject(forKey: "planetImageName") as? String
        
        guard let planetName = optionalPlanetName else { return }
        guard let imageName = optionalImageName else { return }
        
        planet = Planet(name: planetName, imageName: imageName)
    }
    
    
}
