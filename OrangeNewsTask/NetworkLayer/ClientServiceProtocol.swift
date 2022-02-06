//
//  ClientServiceProtocol.swift
//  OrangeNewsTask
//
//  Created by maika on 06/02/2022.
//

import Foundation
import RxSwift

protocol ApiServiceProtocol {
    
    func getNewsList() -> Observable<[ArticlesData]>
    
    func getNewsListData(url: URL) -> Observable<[ArticlesData]>
}
