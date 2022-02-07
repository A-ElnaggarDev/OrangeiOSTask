//
//  IntroService.swift
//  OrangeNewsTask
//
//  Created by maika on 07/02/2022.
//

import Foundation
import RxSwift

class IntroService: IntroServiceProtocol {
    
    enum Endpoint {
        
        static let base = "https://run.mocky.io/v3/"
        
        case country
        case category
        
        var stringValue: String {
            switch self {
            case .country:
                return Endpoint.base + "bbdc504f-11bd-4edf-997c-09e52d15b6a3"
            case .category:
                return Endpoint.base + "35b01e75-d728-4b67-9383-2a71cc8860c6"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    
    func getCountryList() -> Observable<[CountryData]> {
        return getCountryListData(url: Endpoint.country.url)
    }
    
    func getCountryListData(url: URL) -> Observable<[CountryData]> {
        return Observable.create { observable -> Disposable in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    observable.onError(error?.localizedDescription as! Error)
                    return
                }
                do {
                    let countries = try JSONDecoder().decode(CountryResponse.self, from: data)
                    
                    observable.onNext(countries.country)
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
    
    func getCategoryList() -> Observable<[CategoryData]> {
        getCategoryListData(url: Endpoint.category.url)
    }
    
    func getCategoryListData(url: URL) -> Observable<[CategoryData]> {
        return Observable.create { observable -> Disposable in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    observable.onError(error?.localizedDescription as! Error)
                    return
                }
                do {
                    let countries = try JSONDecoder().decode(CategoryResponse.self, from: data)
                    
                    observable.onNext(countries.category)
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
