//
//  UserDetailViewModel.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift
import RxRealm


class UserDetailViewModel {
    private let bag = DisposeBag()
    let user =  AsyncSubject<User>()
    let reachability = Networker.shared
    var userId : String!
    
    func fetchUser(){
        if reachability.currentStatus != .notReachable {
            fetchOnline()
        }else{//network not available
            fetchLocal()
        }
    }
    
    
    func fetchOnline(){
        DataService.getUserDetail(userId) {
            self.fetchLocal()
        } fail: { error in
            self.user.onError(error)
        }
    }
    
    func fetchLocal(){
        let realm = try! Realm()
        if let user = realm.object(ofType: User.self, forPrimaryKey: userId){
            self.user.onNext(user)
        }
        self.user.onCompleted()
    }
    
    
    func resetData(){
        
    }
    
}
