//
//  NetworkService.swift
//  iWeather
//
//  Created by Andrey Buksha on 11.08.2020.
//  Copyright © 2020 Andrey Buksha. All rights reserved.
//

import Foundation

struct NetworkService {
    
    func performRequest<T: Decodable>(url: String,
                                      method: HTTPMethod,
                                      parameters: [String: Any],
                                      completion: @escaping (T?, NetworkError?) -> Void) {
        let urlQueryItems = parameters.map { key, value -> URLQueryItem in
            return URLQueryItem(name: key, value: "\(value)")
        }
        var components = URLComponents(string: url)
        components?.queryItems = urlQueryItems
        guard let url = URL(string: components?.url?.absoluteString ?? "") else {
            completion(nil, NetworkError.invalidUrl)
            return
        }
        var request = URLRequest(url: url,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 120)
        request.httpMethod = method.rawValue
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            guard (200..<300).contains((response as? HTTPURLResponse)?.statusCode ?? 0) else {
                completion(nil, NetworkError.requestFailed)
                return
            }
            if let error = error {
                completion(nil, NetworkError.custom(localizedDescription: error.localizedDescription))
            } else if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let object = try jsonDecoder.decode(T.self, from: data)
                    completion(object, nil)
                } catch {
                    completion(nil, NetworkError.decodeError)
                }
            }
        }
        task.resume()
    }
    
}
