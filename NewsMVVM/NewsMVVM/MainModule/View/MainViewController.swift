//
//  ViewController.swift
//  NewsMVVM
//
//  Created by Mac on 02.06.2021.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var mainViewModel: MainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate() {
        self.mainViewModel = MainViewModel()
        self.mainViewModel.bindMainViewModelToController = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue", let detailVC = segue.destination as? DetaileViewController, let index = sender as? Int {
            detailVC.viewModel = self.mainViewModel.detailesViewModel(index: index)
            print("pass data with success")
        }
        
    }

    //MARK: - TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.mainViewModel.newsData?.articles.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as! NewsTableViewCell
        cell.titleLable.text = mainViewModel.newsData?.articles[indexPath.section].title
        cell.descriptionLabel.text = mainViewModel.newsData?.articles[indexPath.row].articleDescription
        cell.authorLabel.text = mainViewModel.newsData?.articles[indexPath.section].author.rawValue
        cell.imageURL = URL(string: mainViewModel.newsData?.articles[indexPath.section].urlToImage ?? "")
        cell.layer.cornerRadius = 15
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "detailsSegue", sender: indexPath.section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

}

