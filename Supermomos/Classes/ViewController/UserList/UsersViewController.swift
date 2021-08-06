//
//  UsersViewController.swift
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

class UsersViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let bag = DisposeBag()
    private var userListViewModel: UserListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        userListViewModel = UserListViewModel.init()
        self.showProgress()
        startFetch()
        bindToTableView()
        handleSelectedRow()
    }

    func setupTableView(){
        tableView.register(UINib.init(nibName: UserListCell.identifier(), bundle: nil), forCellReuseIdentifier: UserListCell.identifier())
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.es.addPullToRefresh { [weak self] in
            self?.tableView.delegate = nil
            self?.tableView.dataSource = nil
            self?.startFetch()
        }
    }

}

extension UsersViewController {
    fileprivate func startFetch(){
        userListViewModel.fetchUserList()
    }
    fileprivate func bindToTableView(){
        self.hideProgress()
        userListViewModel.listUser.bind(to: tableView.rx.items(cellIdentifier: UserListCell.identifier(), cellType: UserListCell.self)){ row, item, cell in
            cell.loadData(item)
        }.disposed(by: bag)
    }
    
    
    fileprivate func handleSelectedRow(){
        tableView.rx.modelSelected(User.self).bind { [weak self] item in
            guard let self = self else {return}
            if let indexPath = self.tableView.indexPathForSelectedRow {
                self.tableView.deselectRow(at: indexPath, animated: true)
            }
            print(item.login)
        }.disposed(by: bag)
    }
    
}



