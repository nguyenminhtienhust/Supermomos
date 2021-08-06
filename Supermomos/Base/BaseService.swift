//
//  BaseService.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 06/08/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class BaseService : NSObject {
    
    static func postRequest(_ urlString: String, _ params: [String:Any], success: @escaping (_ data: JSON) -> Void, fail: @escaping (_ error: Error) -> Void) {
        
        guard let url = URL.init(string: urlString) else {
            return
        }
        
        AF.request(url, method: HTTPMethod.post, parameters: params, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let results = JSON(value)
                success(results)
            case .failure(let error):
                fail(error)
            }
        }
    }
    
    static func getRequest(_ urlString: String, success: @escaping (_ data: JSON) -> Void, fail: @escaping (_ error: Error) -> Void) {
        
        guard let url = URL.init(string: urlString) else {
            return
        }
        AF.request(url, method: HTTPMethod.get, parameters: [:], encoding: URLEncoding.queryString, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                 success(JSON(value))
            case .failure(let error):
                fail(error)
            }
        }
    }
    
    static func getRequest(_ urlString: String,_ params: [String:Any], success: @escaping (_ data: JSON) -> Void, fail: @escaping (_ error: Error) -> Void) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        AF.request(url, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.queryString, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                 success(JSON(value))
            case .failure(let error):
                fail(error)
            }
        }
    }
}
