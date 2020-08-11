//
//  WeatherService.swift
//  iWeather
//
//  Created by Andrey Buksha on 11.08.2020.
//  Copyright © 2020 Andrey Buksha. All rights reserved.
//

import Foundation

struct WeatherService {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchWeather(query: String, completion: @escaping (Weather?, String?) -> Void) {
        let parameters = [
            "q": query,
            "appid": "b9422c9cce608935ec18b7163652f630",
            "units": "metric",
            "lang": "ru"
        ]
        let urlString = "\(GlobalConstants.URLs.baseUrl.rawValue)/\(GlobalConstants.URLs.weatherEndpoint.rawValue)"
        networkService.performRequest(url: urlString,
                                      method: .get,
                                      parameters: parameters) { (weather: Weather?, error) in
                                        if let weather = weather {
                                            completion(weather, nil)
                                        } else if let error = error {
                                            completion(nil, error.localizedDescription)
                                        } else {
                                            completion(nil, NetworkError.requestFailed.localizedDescription)
                                        }
        }
    }
    
}
