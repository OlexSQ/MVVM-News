//
//  NewsTableViewCell.swift
//  NewsMVVM
//
//  Created by Mac on 02.06.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var newsImageView: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    
    

    var imageURL: URL? {
        didSet {
            newsImageView?.image = nil
            updateUI()
        }
    }
    
    private func updateUI() {
        if let url = imageURL {
            spiner.isHidden = false
            spiner.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async {
                let contentsOfURL = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if url == self.imageURL {
                        if let imageData = contentsOfURL {
                            self.newsImageView.image = UIImage(data: imageData)
                        }
                        self.spiner.isHidden = true
                        self.spiner.stopAnimating()
                    }
                }
            }
        }
    }

}
