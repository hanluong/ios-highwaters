//
//  Flood.swift
//  HighWatersLab
//
//  Created by Han Luong on 3/3/20.
//  Copyright © 2020 Han Luong. All rights reserved.
//

import Foundation

struct Flood {
    let latitude: Double
    let longitude: Double
    
    func toDict() -> [String:Any] {
        return ["latitude": self.latitude, "longitude": self.longitude]
    }
}

extension Flood {
    init?(dictionary: [String:Any]) {
        guard let latitude = dictionary["latitude"] as? Double,
              let longitude = dictionary["longitude"] as? Double else { return nil }
        self.latitude = latitude
        self.longitude = longitude
    }
}
