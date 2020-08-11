//
//  WindInfo.swift
//  iWeather
//
//  Created by Andrey Buksha on 11.08.2020.
//  Copyright © 2020 Andrey Buksha. All rights reserved.
//

import Foundation

struct WindInfo: Decodable {
    
    var speed: Double
    var degree: Int
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
    
}
