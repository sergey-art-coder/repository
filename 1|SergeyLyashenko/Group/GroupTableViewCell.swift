//
//  GroupTableViewCell.swift
//  1|SergeyLyashenko
//
//  Created by Сергей Ляшенко on 18.04.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameGroupLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    // этот метод вызывается каждый раз когда подготавливаем ячейку к переиспользованию (чистим)
    override func prepareForReuse() {
        super.prepareForReuse()
        nameGroupLabel.text = ""
    }
}
