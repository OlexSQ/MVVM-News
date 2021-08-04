//
//  DetaileViewController.swift
//  NewsMVVM
//
//  Created by Mac on 03.06.2021.
//

import UIKit

class DetaileViewController: UIViewController {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var describeTextView: UITextView!
    weak var viewModel: DetaileViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLable.text = self.viewModel?.article.title
        self.describeTextView.text = self.viewModel?.article.content
        let url = URL(string: self.viewModel?.article.urlToImage ?? "")
        if let imageURL = url {
            let data = try? Data(contentsOf: imageURL)
            if let dataForImage = data {
                self.newsImageView.image = UIImage(data: dataForImage)
            }
        }
    }
}
