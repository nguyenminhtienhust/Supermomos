//
//  BaseViewController.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import Foundation
import UIKit

class BaseViewController : UIViewController ,NVActivityIndicatorViewable {
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
    }
    
    func showProgress() {
        let size = CGSize(width: 50, height: 50)
        startAnimating(size, message: nil, type: .ballRotateChase , fadeInAnimation: nil)
    }
    
    func hideProgress() {
        self.stopAnimating(nil)
    }
    
}
