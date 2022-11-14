//
//  ArticleViewController.swift
//  World News
//
//  Created by Юрий Губин on 14.11.2022.
//

import UIKit

class ArticleViewController: UIViewController {
    
    
    @IBOutlet var articleImageView: UIImageView!
    
    @IBOutlet var titleTF: UITextField!
    @IBOutlet var contentTF: UITextField!
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    
    }
    
    private func setupViews() {
        titleTF.text = article?.title ?? ""
        contentTF.text = article?.description ?? ""
        title = article?.source.name ?? ""
        
        NetworkManager.shared.fetchImage(from: article?.urlToImage ?? "") { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.articleImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    

}
