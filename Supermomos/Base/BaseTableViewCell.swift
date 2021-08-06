//
//  BaseTableViewCell.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    static func identifier() -> String{
           return self.className
    }

}
