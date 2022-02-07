//
//  ClientService.swift
//  OrangeNewsTask
//
//  Created by maika on 06/02/2022.
//

import Foundation


enum APIError: String, Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
    case notFound = "Page Not Found"
}

class ClientService {
    
    enum Endpoint {
        static let base = "https://newsapi.org/v2/top-headlines?"
        static let apiKey = "&apiKey=07019b189ce7450ca27f20e1ea53debf"
        static let sortedQuery = "sortedby=date"
        
        case newsList(String, String)
        
        var stringValue: String {
            switch self {
            case .newsList(let country, let category):
                return Endpoint.base + Endpoint.sortedQuery + "&countery=" + country + "&category=" + category + Endpoint.apiKey
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }    
}
