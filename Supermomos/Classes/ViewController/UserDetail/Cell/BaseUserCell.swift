//
//  BaseUserCell.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import UIKit

class BaseUserCell: BaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func loadData(_ user: User){
        //must override
    }

}
