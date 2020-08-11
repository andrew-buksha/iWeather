//
//  WeatherInfo.swift
//  iWeather
//
//  Created by Andrey Buksha on 11.08.2020.
//  Copyright © 2020 Andrey Buksha. All rights reserved.
//

import Foundation

struct WeatherInfo: Decodable {
    
    var temperature: Double
    var feelsLike: Double
    var minTemperature: Double
    var maxTemperature: Double
    var pressure: Int
    var humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case pressure
        case humidity
    }
    
}
