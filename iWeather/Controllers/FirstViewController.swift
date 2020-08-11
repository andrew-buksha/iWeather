//
//  FirstViewController.swift
//  iWeather
//
//  Created by Andrey Buksha on 11.08.2020.
//  Copyright © 2020 Andrey Buksha. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var weatherService: WeatherService!

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherService = WeatherService(networkService: NetworkService())
        weatherService.fetchWeather(query: "Taganrog") { weather, error in
            
        }
    }


}

