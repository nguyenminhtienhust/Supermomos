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
import Reachability


class UserListViewModel {
    private let bag = DisposeBag()
    let listUser = BehaviorRelay<[User]>(value: [User]())
    let reachability = try! Reachability()
    var networkStatus = BehaviorRelay<Bool>(value: false)
    var shouldShowTableView = BehaviorRelay<Bool>(value: true)
    var message = BehaviorRelay<String>(value: "")
    
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
    
    
    func fetchUserList(){
        if reachability.connection != .unavailable{
            fetchOnline()
        } else {
            self.fetchLocal()
            self.message.accept("Network not available")
        }
    }
    
    
    func fetchOnline(){
        DataService.getUserListThenSaveLocal {
            self.fetchLocal()
        } fail: { error in
            self.message.accept(error.localizedDescription)
            self.fetchLocal()
        }
    }
    
    func fetchLocal(){
        let realm = try! Realm()
        let users = realm.objects(User.self)
        shouldShowTableView.accept(users.isEmpty)
        listUser.accept(Array(users))
    }
    
}
