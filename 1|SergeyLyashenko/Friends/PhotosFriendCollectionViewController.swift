//
//  PhotosFriendCollectionViewController.swift
//  1|SergeyLyashenko
//
//  Created by Сергей Ляшенко on 14.05.2021.
//

import UIKit

class PhotosFriendCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let reuseIdentifier = "PhotosFriendsCell"
    var photos: Friend!
    var selectedPhotos = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // зададим отступы
        //        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        // заголовок для Navigation Bar
        title = photos.userName
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.userPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosFriendsCell", for: indexPath) as! PhotosFriendCollectionViewCell
        
        
        let photo = photos.userPhotos[indexPath.item]
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
    
    // сохраняем выбранный индекс в переменной selectedPhotos и убираем выделения
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPhotos = [photos.userPhotos[indexPath.item]]
        performSegue(withIdentifier: "toFriendsPhotos", sender: self)
    }
    
    // метод через который мы переходим на FriendsPhotosViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //вызываем подготовку к переходу
        super.prepare(for: segue, sender: sender)
        
        // проверяем что индитификатор называется "toFriendsPhotos"
        if segue.identifier == "toFriendsPhotos" {
            
            // индекс нажатой ячейки
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                photos.userPhotos = selectedPhotos //фотки
                photos.userPhotos = [photos.userPhotos[indexPath.item]] // indexPath[0][1] если не использовать ?.first выше
            }
            
            guard let detailVC = segue.destination as? FriendsPhotosViewController else { return }
            
            detailVC.photos.userPhotos = selectedPhotos
        }
    }
}
