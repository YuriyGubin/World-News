//
//  NewsCollectionViewController.swift
//  World News
//
//  Created by Юрий Губин on 14.11.2022.
//

import UIKit

class NewsCollectionViewController: UICollectionViewController {
    
    private var publication: News?
    
    private var chosenArcticle: Article!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNews()
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        publication?.articles.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath)
        guard  let cell = cell as? NewsCell else { return UICollectionViewCell() }
        cell.backgroundColor = .systemBackground
        
        if let publish = publication?.articles[indexPath.item] {
            cell.configure(with: publish)
        }
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        self.chosenArcticle = publication?.articles[indexPath.item]
        //performSegue(withIdentifier: "toArticle", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toArticle" {
//            guard let articleVC = segue.destination as? ArticleViewController else { return }
//            let cell = sender as? NewsCell
//            articleVC.article = self.publication?.articles[]

        guard let articleVC = segue.destination as? ArticleViewController else { return }
        
        articleVC.article = self.chosenArcticle
    }
    
    private func fetchNews() {
        NetworkManager.shared.fetchNews(from: Link.url.rawValue) { [weak self] result in
            switch result {
            case .success(let article):
                self?.publication = article
                self?.collectionView.reloadData()
                print(article)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }

}

extension NewsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        40
    }
}
