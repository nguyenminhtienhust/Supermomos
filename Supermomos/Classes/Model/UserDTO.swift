//
//  UserDTO.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import Foundation
import ObjectMapper

struct UserDTO : Mappable {
    //List
    var login : String?
    var id : Int?
    var node_id : String?
    var avatar_url : String?
    var gravatar_id : String?
    var url : String?
    var html_url : String?
    var followers_url : String?
    var following_url : String?
    var gists_url : String?
    var starred_url : String?
    var subscriptions_url : String?
    var organizations_url : String?
    var repos_url : String?
    var events_url : String?
    var received_events_url : String?
    var type : String?
    var site_admin : Bool?

    //Detail
    var name : String?
    var company : String?
    var blog : String?
    var location : String?
    var email : String?
    var hireable : String?
    var bio : String?
    var twitter_username : String?
    var public_repos : Int?
    var public_gists : Int?
    var followers : Int?
    var following : Int?
    
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        login <- map["login"]
        id <- map["id"]
        node_id <- map["node_id"]
        avatar_url <- map["avatar_url"]
        gravatar_id <- map["gravatar_id"]
        url <- map["url"]
        html_url <- map["html_url"]
        followers_url <- map["followers_url"]
        following_url <- map["following_url"]
        gists_url <- map["gists_url"]
        starred_url <- map["starred_url"]
        subscriptions_url <- map["subscriptions_url"]
        organizations_url <- map["organizations_url"]
        repos_url <- map["repos_url"]
        events_url <- map["events_url"]
        received_events_url <- map["received_events_url"]
        type <- map["type"]
        site_admin <- map["site_admin"]
        
        name <- map["name"]
        company <- map["company"]
        blog <- map["blog"]
        location <- map["location"]
        email <- map["email"]
        hireable <- map["hireable"]
        bio <- map["bio"]
        twitter_username <- map["twitter_username"]
        public_repos <- map["public_repos"]
        public_gists <- map["public_gists"]
        followers <- map["followers"]
        following <- map["following"]
    }

}
