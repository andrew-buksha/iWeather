//
//  Weather.swift
//  iWeather
//
//  Created by Andrey Buksha on 11.08.2020.
//  Copyright © 2020 Andrey Buksha. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    
    var weather: [WeatherDesc]
    var main: WeatherInfo
    var visibility: Int
    var wind: WindInfo
    var name: String
    
}
