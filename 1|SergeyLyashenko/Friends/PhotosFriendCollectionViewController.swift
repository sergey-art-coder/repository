//
//  PhotosFriendCollectionViewController.swift
//  1|SergeyLyashenko
//
//  Created by Сергей Ляшенко on 14.05.2021.
//

import UIKit

class PhotosFriendCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let reuseIdentifier = "PhotosFriendsCell"
    var friend: Friend!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // зададим отступы
        //        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        // заголовок для Navigation Bar
        title = friend.userName
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend.userPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosFriendsCell", for: indexPath) as! PhotosFriendCollectionViewCell
        
        let photo = friend.userPhotos[indexPath.item]
        cell.photosFrienndImage.image = photo
        
        return cell
    }
    // прописывам нужный размер ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = collectionView.bounds.width
        let insets = collectionView.contentInset.left + collectionView.contentInset.right
        width -= insets
        width -= 10
        width /= 4
        return CGSize(width: width, height: width)
        
    }
}

