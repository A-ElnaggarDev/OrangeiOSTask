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
        static let base = "https://newsapi.org/v2/"
        static let apiKey = "&apiKey=0ac9edf4fb2944fa9d24d95c07757fbb"
        static let sortedQuery = "sortedby=date"
        
        case newsList(String, String)
        case newsListSearch(String)
        
        var stringValue: String {
            switch self {
            case .newsList(let country, let category):
                return Endpoint.base + "top-headlines?" + Endpoint.sortedQuery + "&countery=" + country + "&category=" + category + Endpoint.apiKey
            case .newsListSearch(let query):
                return Endpoint.base + "everything?q=" + query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! + "&" + Endpoint.sortedQuery + Endpoint.apiKey
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
                    observable.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return
                }
                do {
                    let headlines = try JSONDecoder().decode(HeadlinesResponse.self, from: data)
                    
                    observable.onNext(headlines.articles ?? [])
                } catch {
                    observable.onError(error)
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func getNewsListSearch(query: String) -> Observable<[ArticlesData]> {
        getNewsListSearchData(url: Endpoint.newsListSearch(query).url)
    }
    
    func getNewsListSearchData(url: URL) -> Observable<[ArticlesData]> {
        return Observable.create { observable -> Disposable in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                print("search url \(url)")
                guard let data = data else {
                    print("error in data")
                    observable.onError(error?.localizedDescription as! Error)
                    return
                }
                do {
                    let headlines = try JSONDecoder().decode(HeadlinesResponse.self, from: data)
                    
                    observable.onNext(headlines.articles ?? [])
                } catch {
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
