//
//  EmployeeViewModel.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import Foundation

class EmployeeViewModel {
    var name: String
    var number: String
    var designation: String
    
    init(name: String, number: String, designation: String) {
        self.name = name
        self.number = number
        self.designation = designation
    }
}
