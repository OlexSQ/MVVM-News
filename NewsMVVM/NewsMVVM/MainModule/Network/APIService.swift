//
//  APIService.swift
//  NewsMVVM
//
//  Created by Mac on 02.06.2021.
//

import Foundation

class APIService: NSObject {
    
    private let sourceURL = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=b54123046b58412eba64f5ae784cc9a0")!
    
    func apiToGetNewsData(comletion: @escaping (NewsData) -> ()) {
        URLSession.shared.dataTask(with: sourceURL) { (data, urlResponse, error) in
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let newsData = try! jsonDecoder.decode(NewsData.self, from: data)
                comletion(newsData)
            }
            
        }.resume()
    }
}
