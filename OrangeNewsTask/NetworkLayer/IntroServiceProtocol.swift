//
//  IntroServiceProtocol.swift
//  OrangeNewsTask
//
//  Created by maika on 07/02/2022.
//

import Foundation
import RxSwift

protocol IntroServiceProtocol {
    
    func getCountryList() -> Observable<[CountryData]>
    
    func getCountryListData(url: URL) -> Observable<[CountryData]>
    
    func getCategoryList() -> Observable<[CategoryData]>
    
    func getCategoryListData(url: URL) -> Observable<[CategoryData]>
}
