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
    
    private var friends = [
        Friend(userName: "Ivan Stepanovich", userAvatar: UIImage(named: "friend1")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "group4"), #imageLiteral(resourceName: "group2"), #imageLiteral(resourceName: "group3"), #imageLiteral(resourceName: "Фото Борисович")]),
        Friend(userName: "Степан Петрович", userAvatar: #imageLiteral(resourceName: "friend2"), userPhotos: [#imageLiteral(resourceName: "group2")]),
        Friend(userName: "Алексей Борисович", userAvatar: #imageLiteral(resourceName: "friend3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")]),
        Friend(userName: "Stepan Ivanovich", userAvatar: UIImage(named: "friend2")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "Фото Борисович")]),
        Friend(userName: "Петр Степанович", userAvatar: #imageLiteral(resourceName: "group2"), userPhotos: [#imageLiteral(resourceName: "group2")]),
        Friend(userName: "Андрей Борисович", userAvatar: #imageLiteral(resourceName: "group3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")])
    ]
    
    var selectedFriend: Friend?
    
    // Search
    
    // создаем массив nameFiltered где будут отфильтроанные сообщения которые удовлетворяют условиям поиска
    private var nameFiltered = [Friend]()
    
    private var searchController = UISearchController(searchResultsController: nil)
    
    // проверяем не является строка поиска пустой, если пустой то показываем обычную таблицу
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    // метод который показывает занимаемся ли мы поиском
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         добавляем большой Navigation Bar
         self.navigationController?.navigationBar.prefersLargeTitles = true
         self.navigationController?.navigationItem.largeTitleDisplayMode = .always
         */
        
        // setup the Search Controller (отображаем и настраиваем строку поиска в интерфейсе)
        searchController.searchResultsUpdater = self
        // переходим на PhotosFriendCollectionViewController тапая по отфильтрованым записям
        searchController.obscuresBackgroundDuringPresentation = false
        // задаем пользовательское название для строки поиска
        searchController.searchBar.placeholder = "Поиск друзей"
        // отобразим строку поиска на Navigation Bar
        navigationItem.searchController = searchController
        // отпускаем строку поиска при переходе на другой экран
        definesPresentationContext = true
    }
    
    // MARK: - Table view data source
    
    // количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // передаем количество элементов нашего массива (количество ячеек в секции соответствует колличеству друзей)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return nameFiltered.count
        }
        return friends.count
    }
    
    // запонение ячеек
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // получить ячейку класса FriendTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsTableViewCell
        
        // получаем нужного нам друга обращаясь к массиву друзей
        var friend: Friend
        
        if isFiltering {
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
        performSegue(withIdentifier: "toPhotosFriend", sender: self)
    }
    
    // метод через который мы переходим на PhotosFriendCollectionViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //вызываем подготовку к переходу
        super.prepare(for: segue, sender: sender)
        
        // проверяем что индитификатор называется "toPhotosFriend"
        if segue.identifier == "toPhotosFriend" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let selectedFriend: Friend
                
                if isFiltering {
                    selectedFriend = nameFiltered[indexPath.row]
                } else {
                    selectedFriend = friends[indexPath.row]
                }
                
                // проверяем что контроллер на который мы переходим является контроллером типа PhotosFriendCollectionViewController и передаем тот или иной friend по соответствующему индексу строки
                guard let detailVC = segue.destination as? PhotosFriendCollectionViewController  else { return }
                detailVC.photos = selectedFriend
            }
        }
    }
}

extension FriendsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    // функция filterContentForSearchText, где передаем текст с поля поиска (метод который занимается непосредственно фильтрацией контента, заполняем массив отфильтроваными данными из основного массива friends)
    private func filterContentForSearchText(_ searchText: String) {
        nameFiltered = friends.filter({ (friend: Friend) -> Bool in
            // возвращаем отфильтрованые элементы
            return friend.userName.lowercased().contains(searchText.lowercased())
        })
        
        // перезагрузка таблицы после фильтрации контента
        tableView.reloadData()
    }
}

