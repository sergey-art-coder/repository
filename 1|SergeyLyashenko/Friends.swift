//
//  Friends.swift
//  1|SergeyLyashenko
//
//  Created by Сергей Ляшенко on 19.05.2021.
//

import UIKit

struct Friend {
    var userName: String
    var userAvatar: UIImage
    var userPhotos: [UIImage]
}

private var friends = [
    Friend(userName: "Stepanov Ivan", userAvatar: UIImage(named: "friend1")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "group4"), #imageLiteral(resourceName: "group2"), #imageLiteral(resourceName: "group3"), #imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Петров Степан", userAvatar: #imageLiteral(resourceName: "group3"), userPhotos: [#imageLiteral(resourceName: "group2")]),
    Friend(userName: "Борисов Алексей", userAvatar: #imageLiteral(resourceName: "friend3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Ivanov Stepan", userAvatar: UIImage(named: "friend2")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Степаненко Игорь", userAvatar: #imageLiteral(resourceName: "group5"), userPhotos: [#imageLiteral(resourceName: "group2")]),
    Friend(userName: "Борисов Андрей", userAvatar: #imageLiteral(resourceName: "group3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Иванов Иван", userAvatar: UIImage(named: "friend1")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "group4"), #imageLiteral(resourceName: "group2"), #imageLiteral(resourceName: "group3"), #imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Сидоров Виктор", userAvatar: #imageLiteral(resourceName: "group3"), userPhotos: [#imageLiteral(resourceName: "group2")]),
    Friend(userName: "Корнеухов Степан", userAvatar: #imageLiteral(resourceName: "friend3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Сидоров Сидор", userAvatar: UIImage(named: "friend2")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Petruch Petrucha", userAvatar: #imageLiteral(resourceName: "group5"), userPhotos: [#imageLiteral(resourceName: "group2")]),
    Friend(userName: "Безруков Алексей", userAvatar: #imageLiteral(resourceName: "group3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Tobol Petro", userAvatar: UIImage(named: "friend1")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "group4"), #imageLiteral(resourceName: "group2"), #imageLiteral(resourceName: "group3"), #imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Ivachov Igor", userAvatar: #imageLiteral(resourceName: "group3"), userPhotos: [#imageLiteral(resourceName: "group2")]),
    Friend(userName: "Иванов Иван", userAvatar: #imageLiteral(resourceName: "friend3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Русский Констанотин", userAvatar: UIImage(named: "friend2")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Соломин Петр", userAvatar: #imageLiteral(resourceName: "group5"), userPhotos: [#imageLiteral(resourceName: "group2")]),
    Friend(userName: "Собакин Мухтар", userAvatar: #imageLiteral(resourceName: "group3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Максимов Максим", userAvatar: UIImage(named: "friend1")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "group4"), #imageLiteral(resourceName: "group2"), #imageLiteral(resourceName: "group3"), #imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Володин Виктор", userAvatar: #imageLiteral(resourceName: "group3"), userPhotos: [#imageLiteral(resourceName: "group2")]),
    Friend(userName: "Буряков Владимир", userAvatar: #imageLiteral(resourceName: "friend3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Иванова Сара", userAvatar: UIImage(named: "friend2")!, userPhotos: [#imageLiteral(resourceName: "group5"),#imageLiteral(resourceName: "friend1"),#imageLiteral(resourceName: "Фото Борисович")]),
    Friend(userName: "Прилука Павел", userAvatar: #imageLiteral(resourceName: "group5"), userPhotos: [#imageLiteral(resourceName: "group2")]),
    Friend(userName: "Собакин Алексей", userAvatar: #imageLiteral(resourceName: "group3"), userPhotos: [#imageLiteral(resourceName: "Фото Борисович")])
]
