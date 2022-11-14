//
//  NewsCell.swift
//  World News
//
//  Created by Юрий Губин on 14.11.2022.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    @IBOutlet var newsImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    func configure(with article: Article) {
        titleLabel.text = article.source.name
        subtitleLabel.text = article.title
        
        DispatchQueue.global().async {
            guard let stringUrl = article.urlToImage else { return }
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.newsImageView.image = UIImage(data: imageData)
            }
        }
    }
    
}
