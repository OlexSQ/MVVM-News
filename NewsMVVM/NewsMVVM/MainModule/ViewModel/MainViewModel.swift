//
//  MainViewModel.swift
//  NewsMVVM
//
//  Created by Mac on 02.06.2021.
//

import Foundation

class MainViewModel: NSObject {
    private var apiService: APIService!
    var detailesViewModel: DetaileViewModel!
    
    private(set) var newsData: NewsData! {
        didSet {
            self.bindMainViewModelToController()
        }
    }
    
    var bindMainViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetNewsData()
    }
    
    func callFuncToGetNewsData() {
        self.apiService.apiToGetNewsData { (newsData) in
            self.newsData = newsData
        }
    }
    
    func detailesViewModel(index: Int) -> DetaileViewModel {
        self.detailesViewModel = DetaileViewModel(article: newsData.articles[index])
        print("Creating view model")
        return self.detailesViewModel
    }
    
}

