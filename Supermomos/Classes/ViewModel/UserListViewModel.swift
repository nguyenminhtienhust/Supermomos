//
//  UserViewModel.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift
import RxRealm


class UserListViewModel {
    private let bag = DisposeBag()
    let listUser : PublishSubject<Results<User>> = PublishSubject()
    let reachability = Networker.shared

    func fetchUserList(){
        if reachability.currentStatus != .notReachable {
            fetchOnline()
        }else{//network not available
            fetchLocal()
        }
    }
    
    
    func fetchOnline(){
        DataService.getUserList {
            self.fetchLocal()
        } fail: { error in
            self.fetchLocal()
        }
    }
    
    func fetchLocal(){
        let realm = try! Realm()
        let users = realm.objects(User.self)
        self.listUser.onNext(users)
        self.listUser.onCompleted()
    }
    
    
    func resetData(){
        
    }
    
}
