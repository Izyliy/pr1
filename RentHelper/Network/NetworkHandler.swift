//
//  NetworkHandler.swift
//  RentHelper
//
//  Created by Павел Грабчак on 21.06.2022.
//

/*
 pathComponents [String]
 method HTTPMethod
 query [String:String]
 body Data
 headers [String:String]
*/

import Foundation
import Promises

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

struct NetworkConfig {
    let pathComponents: [String]
    let method: HTTPMethod
    let query: [String:String]?
    let body: Data?
    let headers: [String:String]?
    
    init(pathComponents: [String],
         method: HTTPMethod,
         query: [String:String]? = nil,
         body: Data? = nil,
         headers: [String:String]? = nil) {
        self.pathComponents = pathComponents
        self.method = method
        self.query = query
        self.body = body
        self.headers = headers
    }
}

class NetworkHandler {
    func performRequest<T: Codable>(config: NetworkConfig) -> Promise<T> {
        guard let urlString = UserDefaults.standard.string(forKey: "Server URL"),
              var url = URL(string: urlString)
        else {
            fatalError("Unable to convert server url string to URL")
        }
        let promise = Promise<T>.pending()

        for component in config.pathComponents { url = url.appendingPathComponent(component) }
        
        if let query = config.query {
            for item in query {
//                url.qu
            }
        }
        
        var request = URLRequest(url: url)
        
        if let headers = config.headers {
            for item in headers {
                request.addValue(item.value, forHTTPHeaderField: item.key)
            }
        }
        
        request.httpMethod = config.method.rawValue
        
        request.httpBody = config.body

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
        }

        task.resume()
        return promise
    }
    
//    private func getStandartURL(pathComponents: [String], query: [String:String]) -> URL {
//
//    }
}
