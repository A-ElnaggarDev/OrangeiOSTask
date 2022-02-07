//
//  CategoryResponse.swift
//  OrangeNewsTask
//
//  Created by maika on 07/02/2022.
//

import Foundation

struct CategoryResponse: Decodable {
    let category: [CategoryData]
}

struct CategoryData: Decodable {
    let id: Int
    let name: String
}
