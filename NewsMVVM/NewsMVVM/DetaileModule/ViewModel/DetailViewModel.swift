//
//  DetailViewModel.swift
//  NewsMVVM
//
//  Created by Mac on 03.06.2021.
//

import Foundation

class DetaileViewModel {

    private(set) var article: Article!
        
    required init(article: Article) {

        self.article = article
    }
    
}
