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
import Reachability


class UserDetailViewModel {
    private let bag = DisposeBag()
    let user = BehaviorRelay<User>(value: User())
    let reachability = try! Reachability()
    var networkStatus = BehaviorRelay<Bool>(value: false)

    func observerNetwork(){
        reachability.whenReachable = { reachability in
            self.networkStatus.accept(true)
        }
        reachability.whenUnreachable = { _ in
            self.networkStatus.accept(false)
        }
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    func fetchUser(_ id: Int){
        if reachability.connection != .unavailable{
            fetchOnline(id)
        } else {
            fetchLocal(id)
        }
    }
    
    
    func fetchOnline(_ id: Int){
        DataService.getUserDetailThenSaveLocal(id) {
            self.fetchLocal(id)
        } fail: { error in
            self.fetchLocal(id)
        }
    }
    
    func fetchLocal(_ id: Int){
        let realm = try! Realm()
        if let object = realm.object(ofType: User.self, forPrimaryKey: id){
            user.accept(object)
        }
    }
}
