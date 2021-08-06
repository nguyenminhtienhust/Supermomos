//
//  UserDetailViewController.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import UIKit
import Toast
import ESPullToRefresh
import RxSwift
import RxRealm
import RxCocoa
import RealmSwift


class UserDetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    private let bag = DisposeBag()
    var userId: String!
    private var userDetailViewModel: UserDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
        bindingData()
    }

    func setupTableView(){
        userDetailViewModel = UserDetailViewModel.init()
        tableView.register(UINib.init(nibName: UserInfoCell.identifier(), bundle: nil), forCellReuseIdentifier: UserInfoCell.identifier())
        tableView.register(UINib.init(nibName: UserStatisticCell.identifier(), bundle: nil), forCellReuseIdentifier: UserStatisticCell.identifier())
        tableView.register(UINib.init(nibName: UserBioCell.identifier(), bundle: nil), forCellReuseIdentifier: UserBioCell.identifier())

        tableView.es.addPullToRefresh { [weak self] in
            
        }
    }

}

extension UserDetailViewController {
    func setupViewModel(){
        userDetailViewModel = UserDetailViewModel()
        userDetailViewModel.fetchUser()
    }
    
    func bindingData(){
        userDetailViewModel.user.subscribe(onNext: { user in
            
        }).disposed(by: bag)

    }
}



