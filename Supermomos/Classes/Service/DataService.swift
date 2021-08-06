//
//  DataService.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON

struct DataService {
    static func getUserListThenSaveLocal(success: @escaping () -> Void, fail: @escaping (Error) -> Void) {
        let realm = try! Realm()

        BaseService.getRequest(UserURL) { json in
            let userList = json.arrayValue
            for user in userList {
                if let dto = UserDTO.init(JSON: user.dictionaryObject!) {
                    let userObject = User.mappingFromDTO(dto)
                    try! realm.write {
                        realm.add(userObject, update: Realm.UpdatePolicy.all)
                    }
                }
            }
            success()
        } fail: { error in
            fail(error)
        }
    }
    
    
    static func getUserDetailThenSaveLocal(_ id: Int, success: @escaping () -> Void, fail: @escaping (Error) -> Void) {
        let realm = try! Realm()
        let urlDetailURL = UserDetailURL + id.description
        
        BaseService.getRequest(urlDetailURL) { json in
            if let dto = UserDTO.init(JSON: json.dictionaryObject!) {
                let userObject = User.mappingFromDTO(dto)
                try! realm.write {
                    realm.add(userObject, update: Realm.UpdatePolicy.all)
                }
            }
            success()
        } fail: { error in
            fail(error)
        }
    }
    
}
