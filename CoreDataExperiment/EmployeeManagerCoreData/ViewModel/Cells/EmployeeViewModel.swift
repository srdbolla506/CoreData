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
    var location: String
    var address: String
    var phone: String
    
    init(employee: Employee) {
        self.name = employee.name ?? ""
        self.number = employee.id ?? ""
        self.designation = employee.designation ?? ""
        self.address = employee.address ?? ""
        self.location = employee.location ?? ""
        self.phone = employee.phone ?? ""
    }
    
    init() {
        self.name = ""
        self.number = ""
        self.designation = ""
        self.location = ""
        self.address = ""
        self.phone = ""
    }
}
