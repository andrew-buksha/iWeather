//
//  NetworkError.swift
//  iWeather
//
//  Created by Andrey Buksha on 11.08.2020.
//  Copyright © 2020 Andrey Buksha. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    
    case invalidUrl
    case requestFailed
    case decodeError
    case custom(localizedDescription: String)
    
    var localizedDescription: String {
        switch self {
        case .invalidUrl:
            return "URL is invalid"
        case .requestFailed:
            return "URL request failed"
        case .decodeError:
            return "Failed to decode JSON"
        case let .custom(localizedDescription):
            return localizedDescription
        }
    }
    
}
