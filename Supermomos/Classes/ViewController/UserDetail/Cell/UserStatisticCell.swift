//
//  UserStatisticCell.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import UIKit

class UserStatisticCell: BaseUserCell {

    
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var reposLabel: UILabel!
    
    @IBOutlet weak var followersTitleLabel: UILabel!
    @IBOutlet weak var followingTitleLabel: UILabel!
    @IBOutlet weak var reposLTitleabel: UILabel!
    @IBOutlet weak var underlineView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        followersLabel.textColor = UIColor(mainColor)
        followingLabel.textColor = UIColor(mainColor)
        reposLabel.textColor = UIColor(mainColor)
        followersTitleLabel.textColor = UIColor(mainColor)
        followingTitleLabel.textColor = UIColor(mainColor)
        reposLTitleabel.textColor = UIColor(mainColor)
        underlineView.alpha = 0.5
    }

    override func loadData(_ user: User) {
        super.loadData(user)
        followersLabel.text = user.followers.description
        followingLabel.text = user.following.description
        reposLabel.text = user.public_repos.description
    }
}
