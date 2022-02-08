//
//  ClientServiceProtocol.swift
//  OrangeNewsTask
//
//  Created by maika on 06/02/2022.
//

import Foundation
import RxSwift

protocol ClientServiceProtocol {
    
    func getNewsList(country: String, category: String) -> Observable<[ArticlesData]>
    
    func getNewsListData(url: URL) -> Observable<[ArticlesData]>
    
    func getNewsListSearch(query: String) -> Observable<[ArticlesData]>
    
    func getNewsListSearchData(url: URL) -> Observable<[ArticlesData]>
}
