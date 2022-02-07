//
//  SelectCountryViewModel.swift
//  OrangeNewsTask
//
//  Created by maika on 06/02/2022.
//

import Foundation
import RxSwift

class SelectCountryViewModel {
    
    let title = "select country"
    let introService: IntroServiceProtocol
    
    init(introService: IntroServiceProtocol = IntroService()) {
        self.introService = introService
    }
    
    func getCountry() -> Observable<[CountryData]> {
        return introService.getCountryList()
    }
}
