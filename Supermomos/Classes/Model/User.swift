//
//  User.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import Foundation
import RealmSwift

class User : Object {
    //List
    @objc dynamic var login : String = ""
    @objc dynamic var id : Int = 0
    @objc dynamic var node_id : String = ""
    @objc dynamic var avatar_url : String = ""
    @objc dynamic var gravatar_id : String = ""
    @objc dynamic var url : String = ""
    @objc dynamic var html_url : String = ""
    @objc dynamic var followers_url : String = ""
    @objc dynamic var following_url : String = ""
    @objc dynamic var gists_url : String = ""
    @objc dynamic var starred_url : String = ""
    @objc dynamic var subscriptions_url : String = ""
    @objc dynamic var organizations_url : String = ""
    @objc dynamic var repos_url : String = ""
    @objc dynamic var events_url : String = ""
    @objc dynamic var received_events_url : String = ""
    @objc dynamic var type : String = ""
    @objc dynamic var site_admin : Bool = false

    //Detail
    @objc dynamic var name : String = ""
    @objc dynamic var company : String = ""
    @objc dynamic var blog : String = ""
    @objc dynamic var location : String = ""
    @objc dynamic var email : String = ""
    @objc dynamic var hireable : String = ""
    @objc dynamic var bio : String = ""
    @objc dynamic var twitter_username : String = ""
    @objc dynamic var public_repos : Int = 0
    @objc dynamic var public_gists : Int = 0
    @objc dynamic var followers : Int = 0
    @objc dynamic var following : Int = 0
    
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    
    static func mappingFromDTO(_ dto: UserDTO) -> User {
        let user = User()
        user.login = dto.login ?? ""
        user.id = dto.id ?? 0
        user.node_id = dto.node_id ?? ""
        user.avatar_url = dto.avatar_url ?? ""
        user.gravatar_id = dto.gravatar_id ?? ""
        user.url = dto.url ?? ""
        user.html_url = dto.html_url ?? ""
        user.followers_url = dto.followers_url ?? ""
        user.following_url = dto.following_url ?? ""
        user.gists_url = dto.gists_url ?? ""
        user.starred_url = dto.starred_url ?? ""
        user.subscriptions_url = dto.subscriptions_url ?? ""
        user.organizations_url = dto.organizations_url ?? ""
        user.repos_url = dto.repos_url ?? ""
        user.events_url = dto.events_url ?? ""
        user.received_events_url = dto.received_events_url ?? ""
        user.type = dto.type ?? ""
        user.site_admin = dto.site_admin ?? false
        user.name = dto.name ?? ""
        user.company = dto.company ?? ""
        user.blog = dto.blog ?? ""
        user.location = dto.location ?? ""
        user.email = dto.email ?? ""
        user.hireable = dto.hireable ?? ""
        user.bio = dto.bio ?? ""
        user.twitter_username = dto.twitter_username ?? ""
        user.public_repos = dto.public_repos ?? 0
        user.public_gists = dto.public_gists ?? 0
        user.followers = dto.followers ?? 0
        user.following = dto.following ?? 0
        return user
    }
    
}
