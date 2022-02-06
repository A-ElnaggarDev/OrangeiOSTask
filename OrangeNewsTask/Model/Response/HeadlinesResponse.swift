//
//  HeadlinesResponse.swift
//  OrangeNewsTask
//
//  Created by maika on 06/02/2022.
//

import Foundation

struct HeadlinesResponse: Decodable {
    let articles: [ArticlesData]
}

struct ArticlesData: Decodable {
    let title: String
    let description: String
    let source: SourceData
    let url: String
    let urlToImage: String
    let publishedAt: String
}

struct SourceData: Decodable {
    let name: String
}
