//
//  UsersViewController.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import UIKit
import Toast
import RxSwift
import RxCocoa
import RealmSwift

class UsersViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let bag = DisposeBag()
    private var userListViewModel: UserListViewModel!
    @IBOutlet weak var networkIconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        showProgress()
        setupViewModel()
    }

    func setupTableView(){
        tableView.register(UINib.init(nibName: UserListCell.identifier(), bundle: nil), forCellReuseIdentifier: UserListCell.identifier())
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.setLoadMoreEnable(true)
        let animator = TextLoadingAnimator()
        tableView.addPullToRefresh(withAnimator: animator, height: 60) { [weak self] in
            self?.startFetchData()
        }
    }

}

extension UsersViewController {
    fileprivate func setupViewModel(){
        userListViewModel = UserListViewModel.init()
        userListViewModel.observerNetwork()
        startFetchData()
        checkNetwork()
        bindToTableView()
        handleSelectedRow()
    }
    fileprivate func startFetchData(){
        userListViewModel.fetchUserList()
    }
    
    fileprivate func checkNetwork(){
        userListViewModel.networkStatus.bind(to: networkIconImageView.rx.isHidden).disposed(by: bag)
    }
    
    fileprivate func bindToTableView(){
        self.hideProgress()
        userListViewModel.listUser.subscribe { [weak self] event in
            self?.tableView.stopPullToRefresh()
        }.disposed(by: bag)
        
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
            let userDetailVC = UserDetailViewController()
            userDetailVC.userId = item.id
            self.navigationController?.pushViewController(userDetailVC, animated: true)
        }.disposed(by: bag)
    }
}



