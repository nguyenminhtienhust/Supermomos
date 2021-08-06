//
//  UserInfoCell.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import UIKit
import Kingfisher

class UserInfoCell: BaseUserCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var underlineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width/2
        avatarImageView.layer.borderWidth = 5
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        underlineView.alpha = 0.5
        randomBackground()
        nameLabel.textColor = UIColor(mainColor)
        locationLabel.textColor = UIColor(mainColor)
    }

    func randomBackground(){
        let bgs = ["bg1","bg2","bg3","bg4","bg5"]
        if let selectedBg = bgs.randomElement(){
            backgroundImageView.image = UIImage.init(named: selectedBg)
        }
    }
    
    override func loadData(_ user: User) {
        super.loadData(user)
        nameLabel.text = user.name
        locationLabel.text = user.location
        avatarImageView.kf.indicatorType = .activity
        if let url = URL.init(string: user.avatar_url){
            avatarImageView.kf.setImage(with: url,placeholder: UIImage.init(named: "user_placeholder"))
        }
    }
    
    
}
