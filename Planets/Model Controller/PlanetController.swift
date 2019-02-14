//
//  PlanetController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

extension Notification.Name{
    static let planetsDidChange = Notification.Name("planetsDidChange")
}

class PlanetController {
    
    var shouldShowPluto: Bool {
        get {
            return UserDefaults.standard.bool(forKey: .shouldShowPlutoKey)
            //return NSUbiquitousKeyValueStore.default.bool(forKey: .shouldShowPlutoKey)
        } set {
            UserDefaults.standard.set(newValue, forKey: .shouldShowPlutoKey)
            //NSUbiquitousKeyValueStore.default.set(newValue, forKey: .shouldShowPlutoKey)
            NotificationCenter.default.post(name: .planetsDidChange, object: self)
        }
    }
    
    var planets: [Planet] {
        var results = [
            Planet(name: "Mercury", imageName: "mercury"),
            Planet(name: "Venus", imageName: "venus"),
            Planet(name: "Earth", imageName: "earth"),
            Planet(name: "Mars", imageName: "mars"),
            Planet(name: "Jupiter", imageName: "jupiter"),
            Planet(name: "Saturn", imageName: "saturn"),
            Planet(name: "Uranus", imageName: "uranus"),
            Planet(name: "Neptune", imageName: "neptune"),
            Planet(name: "Pluto", imageName: "pluto"),
            ]
        if shouldShowPluto {
            results.append(Planet(name: "Pluto", imageName: "pluto"))
        }
        return results
    }
}
