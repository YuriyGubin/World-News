//
//  NewsCollectionViewController.swift
//  World News
//
//  Created by Юрий Губин on 14.11.2022.
//

import UIKit

class NewsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 15
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath)
        guard  let cell = cell as? NewsCell else { return UICollectionViewCell() }
        cell.backgroundColor = .systemBackground
        cell.titleLabel.text = "The Washington Post"
        cell.subtitleLabel.text = "Информируем о возможности просмотра в непрерывном режиме, круглосуточно и без взимания платы общероссийских обязательных общедоступных телеканалов (Первый канал, Телеканал (Россия-1), Телеканал, Телекомпания НТВ, Петербург - 5 канал, Телеканал  (Россия-К), Российский информационный канал  (Россия-24), Детско-юношеский телеканал, Телеканал, ТВ ЦЕНТР — Москва) и телеканалов, получивших право на осуществление эфирного цифрового наземного вещания с использованием позиций в мультиплексах на всей территории Российской Федерации (Телесеть REN TV, Первый общественный православный телеканал "
        cell.newsImageView.image = UIImage(named: "tesla")
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension NewsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        40
    }
}
