//
//  FriendPhotoViewControllerCollection.swift
//  1|SergeyLyashenko
//
//  Created by Сергей Ляшенко on 19.05.2021.
//

import UIKit

class FriendPhotoViewControllerCollection: UIViewController {
    
    private let reuseIdentifier = "FriendPhotoCell"
    var photosFriend: Friend!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let friendPhotoCell = "FriendPhotoCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(UINib(nibName: "FriendPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: friendPhotoCell)
    }
 
}

extension FriendPhotoViewControllerCollection: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // нам передается в виде параметра сама collectionView, а мы должны вернуть количество секций в этой таблице
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // получаем myCollectionView в качестве параметров и номер секции, а должны вернуть количество строк в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosFriend.userPhotos.count
    }
    
    // indexPath - структура где содержится номер секции и номер строки (row - текущая строка, section - секция), а вернуть должны ячейку (cell)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // метод dequeueReusableCell выдергивает ту ячейку которая лежит освобожденная в памяти
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: friendPhotoCell, for: indexPath) as? FriendPhotoCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photosFriend.userPhotos[indexPath.item]
        cell.myImageView.image = photo
        
        return cell
    }
    
    
}
