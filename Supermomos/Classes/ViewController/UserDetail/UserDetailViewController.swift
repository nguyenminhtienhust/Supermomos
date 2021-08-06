//
//  UserDetailViewController.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import UIKit
import Toast
import RxSwift
import RxCocoa
import RealmSwift

enum UserCell : Int {
    case Info = 1
    case Statistic = 2
    case Bio = 3
}


class UserDetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    private let bag = DisposeBag()
    private var userDetailViewModel: UserDetailViewModel!
    @IBOutlet weak var networkIconImageView: UIImageView!
    var userId: Int!
    var currentUser : User!
    var listCell : [UserCell] = [.Info,.Statistic,.Bio]
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        showProgress()
        setupViewModel()
    }

    func setupTableView(){
        userDetailViewModel = UserDetailViewModel.init()
        tableView.register(UINib.init(nibName: UserInfoCell.identifier(), bundle: nil), forCellReuseIdentifier: UserInfoCell.identifier())
        tableView.register(UINib.init(nibName: UserStatisticCell.identifier(), bundle: nil), forCellReuseIdentifier: UserStatisticCell.identifier())
        tableView.register(UINib.init(nibName: UserBioCell.identifier(), bundle: nil), forCellReuseIdentifier: UserBioCell.identifier())
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white
        let animator = TextLoadingAnimator()
        tableView.addPullToRefresh(withAnimator: animator, height: 60) { [weak self] in
            self?.startFetchData()
        }
    }

}

extension UserDetailViewController {
    
    fileprivate func setupViewModel(){
        userDetailViewModel = UserDetailViewModel()
        userDetailViewModel.observerNetwork()
        startFetchData()
        checkNetwork()
        bindingData()
    }
    
    fileprivate func startFetchData(){
        userDetailViewModel.fetchUser(userId)
    }
    
    fileprivate func checkNetwork(){
        userDetailViewModel.networkStatus.bind(to: networkIconImageView.rx.isHidden).disposed(by: bag)
    }
    
    
    fileprivate func bindingData(){
        self.hideProgress()
        userDetailViewModel.user.subscribe { [weak self] user in
            self?.currentUser = user
            self?.tableView.stopPullToRefresh()
            self?.tableView.reloadData()
        } onError: { error in
            self.view.makeToast(error.localizedDescription)
        } onCompleted: {
            
        } onDisposed: {
            
        }.disposed(by: bag)

    }
}

extension UserDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCell.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = listCell[indexPath.row]
        var cell = BaseUserCell()
        
        switch item {
        case .Info:
            cell = tableView.dequeueReusableCell(withIdentifier: UserInfoCell.identifier()) as! UserInfoCell
            break
        case .Statistic:
            cell = tableView.dequeueReusableCell(withIdentifier: UserStatisticCell.identifier()) as! UserStatisticCell
            break
        case .Bio:
            cell = tableView.dequeueReusableCell(withIdentifier: UserBioCell.identifier()) as! UserBioCell
            break
        default:
            break
        }
        cell.loadData(currentUser)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

