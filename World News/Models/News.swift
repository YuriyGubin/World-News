//
//  News.swift
//  World News
//
//  Created by Yuriy on 14.11.2022.
//

import Foundation

struct News: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Decodable {
    let name: String
}
