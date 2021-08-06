//
//  UserBioCell.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import UIKit

class UserBioCell: BaseUserCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func loadData(_ user: User) {
        super.loadData(user)
        titleLabel.text = user.bio
        contentLabel.text = user.company
    }
    
}
