//
//  FriendsTableViewController.swift
//  1|SergeyLyashenko
//
//  Created by Сергей Ляшенко on 18.04.2021.
//

import UIKit

struct Friend {
    var userName: String
    var userAvatar: UIImage
    var userPhotos: [UIImage]
}

class FriendsTableViewController: UITableViewController {
    
    var friends = [
        Friend(userName: "Ivan Stepanovich", userAvatar: UIImage(named: "friend1")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "group4"), #imageLiteral(resourceName: "group2"), #imageLiteral(resourceName: "group3"), #imageLiteral(resourceName: "Фото Борисович")]),
        Friend(userName: "Степан Петрович", userAvatar: #imageLiteral(resourceName: "friend2"), userPhotos: [#imageLiteral(resourceName: "group2")]),
        Friend(userName: "Алексей Борисович", userAvatar: #imageLiteral(resourceName: "friend3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")]),
        Friend(userName: "Stepan Ivanovich", userAvatar: UIImage(named: "friend2")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "Фото Борисович")]),
        Friend(userName: "Петр Степанович", userAvatar: #imageLiteral(resourceName: "group2"), userPhotos: [#imageLiteral(resourceName: "group2")]),
        Friend(userName: "Андрей Борисович", userAvatar: #imageLiteral(resourceName: "group3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")])
    ]
    
    var selectedFriend: Friend?
    
    // Search
    var search = UISearchController()
    
    // создаем массив nameFiltered где будут отфильтроанные сообщения которые удовлетворяют условиям поиска
    var nameFiltered = [Friend]()
    
    // функция filterName, где передаем текст с поля поиска
    func filterName(text: String) {
        // удаляем все отфильтрованне имена (чистим массив)
        nameFiltered.removeAll()
        // потом заполняем новыми данными
        nameFiltered = friends.filter({ (Friend) -> Bool in
            return Friend.userName.lowercased().contains(text.lowercased())
        })
    }
    
    // проверяем пустой ли searchBar, если пустой то показываем обычную таблицу
    func searchBarIsEmpty() -> Bool {
        return search.searchBar.text?.isEmpty ?? true
    }
    
    // метод который показывает занимаемся ли мы поиском
    func isSearch() -> Bool {
        return search.isActive && !searchBarIsEmpty()
    }
    
    // функция которая отправляет текст в filterName
    func filterSearchFriend(text: String) {
        filterName(text: text)
        // перезагрузка таблицы
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // добавляем большой Navigation Bar
        //        self.navigationController?.navigationBar.prefersLargeTitles = true
        //        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        //        
        // добавляем строку поиска
        search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
    }
    
    // MARK: - Table view data source
    // количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // количество ячеек в секции соответствует колличеству друзей
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearch() {
            return nameFiltered.count
        }
        return friends.count
    }
    
    // запонение ячеек
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // получить ячейку класса FriendTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsTableViewCell
        
        // получаем нужного нам друга обращаясь к массиву друзей
        //let friend = friends[indexPath.row]
        
        var friend: Friend
        
        if isSearch() {
            friend = nameFiltered[indexPath.row]
        } else {
            
            friend = friends[indexPath.row]
        }
        
        cell.nameFriendLabel.text = friend.userName
        cell.photoImageView.image = friend.userAvatar
        return cell
    }
    
    // сохраняем выбранный индекс в переменной selectedFriend и убираем выделения
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFriend = friends[indexPath.row]
        //selectedFriend = nameFiltered[indexPath.row]
        performSegue(withIdentifier: "toPhotosFriend", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // вызываем подготовку к переходу
        super.prepare(for: segue, sender: sender)
        // проверяем что индитификатор называется "toPhotosFriend"
        if segue.identifier == "toPhotosFriend",
           // проверяем что контроллер на который мы переходим является контроллером типа PhotosFriendCollectionViewController
           let destination = segue.destination as? PhotosFriendCollectionViewController {
            destination.friend = selectedFriend
        }
    }
}
extension FriendsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterSearchFriend(text: searchController.searchBar.text!)
    }
}

