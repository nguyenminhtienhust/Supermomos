//
//  UserListCell.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//


import UIKit
import Kingfisher

class UserListCell: BaseTableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width/2
        avatarImageView.kf.indicatorType = .activity
    }
    
    func loadData(_ model: User){
        nameLabel.text = model.login
        urlLabel.text = model.url
        if let url = URL.init(string: model.avatar_url){
            avatarImageView.kf.setImage(with: url,placeholder: UIImage.init(named: "user_placeholder"))
        }
    }
    
}
