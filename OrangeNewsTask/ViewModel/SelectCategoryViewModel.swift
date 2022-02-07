//
//  SelectCategoryViewModel.swift
//  OrangeNewsTask
//
//  Created by maika on 07/02/2022.
//

import Foundation
import RxSwift

class SelectCategoryViewModel {
    let title = "select category"
    let introService: IntroServiceProtocol
    
    init(introService: IntroServiceProtocol = IntroService()) {
        self.introService = introService
    }
    
    func getCountry() -> Observable<[CategoryData]> {
        return introService.getCategoryList()
    }
}
