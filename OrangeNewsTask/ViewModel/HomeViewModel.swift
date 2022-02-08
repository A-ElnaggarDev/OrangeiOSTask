//
//  HomeViewModel.swift
//  OrangeNewsTask
//
//  Created by maika on 08/02/2022.
//

import Foundation
import RxSwift

class HomeViewModel {
    let clientService: ClientServiceProtocol
    
    init(clientService: ClientServiceProtocol = ClientService()) {
        self.clientService = clientService
    }
    
    func getHeadlinesList(country: String, category: String) -> Observable<[CategoryData]> {
        return clientService.getNewsList(country: country, category: category)
    }
    
}
