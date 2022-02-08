//
//  HomeViewModel.swift
//  OrangeNewsTask
//
//  Created by maika on 08/02/2022.
//

import Foundation
import RxSwift

class HomeViewModel {
    let title = "News"
    let clientService: ClientServiceProtocol
    
    init(clientService: ClientServiceProtocol = ClientService()) {
        self.clientService = clientService
    }
    
    func getHeadlinesList(country: String, category: String) -> Observable<[ArticlesData]> {
        return clientService.getNewsList(country: country, category: category)
    }
    
    func getNewsSearchData(query: String) -> Observable<[ArticlesData]> {
        return clientService.getNewsListSearch(query: query)
    }
    
}
