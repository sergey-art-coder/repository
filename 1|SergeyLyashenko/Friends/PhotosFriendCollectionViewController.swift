//
//  PhotosFriendCollectionViewController.swift
//  3|SergeyLyashenko
//
//  Created by Сергей Ляшенко on 14.05.2021.
//

import UIKit



class PhotosFriendCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let reuseIdentifier = "FriendsCell"
    var friend: Friend!

    override func viewDidLoad() {
        super.viewDidLoad()
        // зададим отступы
//        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend.userPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsCell", for: indexPath) as! PhotosFriendCollectionViewCell
        
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

