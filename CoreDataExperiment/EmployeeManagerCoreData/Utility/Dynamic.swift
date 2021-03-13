//
//  Dynamic.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import Foundation

class Dynamic<T> {
    
    var value: T {
        willSet {
            listener?(value)
        }
    }
    
    typealias Listener = (T?) -> Void
    var listener: Listener?

    
    init(value: T) {
        self.value = value
    }
    
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
    }
    
}
