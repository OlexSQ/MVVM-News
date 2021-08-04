//
//  NewsData.swift
//  NewsMVVM
//
//  Created by Mac on 02.06.2021.
//

import Foundation

// MARK: - NewsData
struct NewsData: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: Author
    let title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt, content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

enum Author: String, Codable {
    case bbcNews = "BBC News"
    case bbcSport = "BBC Sport"
}

// MARK: - Source
struct Source: Codable {
    let id: ID
    let name: Author
}

enum ID: String, Codable {
    case bbcNews = "bbc-news"
}
