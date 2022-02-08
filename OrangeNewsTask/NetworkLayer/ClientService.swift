//
//  ClientService.swift
//  OrangeNewsTask
//
//  Created by maika on 06/02/2022.
//

import Foundation
import RxSwift

enum APIError: String, Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
    case notFound = "Page Not Found"
}

class ClientService: ClientServiceProtocol {
    
    
    
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
    
    func getNewsList(country: String, category: String) -> Observable<[ArticlesData]> {
        getNewsListData(url: Endpoint.newsList(country, category).url)
    }
    
    func getNewsListData(url: URL) -> Observable<[ArticlesData]> {
        return Observable.create { observable -> Disposable in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    print("error in data")
                    observable.onError(error?.localizedDescription as! Error)
                    return
                }
                do {
                    print("news url is \(url)")
                    let headlines = try JSONDecoder().decode(HeadlinesResponse.self, from: data)
                    
                    observable.onNext(headlines.articles)
                } catch {
                    print("error in decode")
                    observable.onError(error)
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
