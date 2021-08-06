//
//  BehaviorRelay+Extension.swift
//  Supermomos
//
//  Created by Tien Nguyen Minh on 07/08/2021.
//

import Foundation
import RxSwift
import RxCocoa

extension BehaviorRelay where Element: RangeReplaceableCollection {
    
    func append(_ subElement: Element.Element) {
        var newValue = value
        newValue.append(subElement)
        accept(newValue)
    }
    
    func append(contentsOf: [Element.Element]) {
        var newValue = value
        newValue.append(contentsOf: contentsOf)
        accept(newValue)
    }
    
    public func remove(at index: Element.Index) {
        var newValue = value
        newValue.remove(at: index)
        accept(newValue)
    }
    
    public func removeAll() {
        var newValue = value
        newValue.removeAll()
        accept(newValue)
    }
    
}
