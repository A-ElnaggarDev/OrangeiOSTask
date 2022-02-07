//
//  CountryResponse.swift
//  OrangeNewsTask
//
//  Created by maika on 07/02/2022.
//

import Foundation

struct CountryResponse: Decodable {
    let country: [CountryData]
}

struct CountryData: Decodable {
    let id: Int
    let name: String
    let code: String
}

