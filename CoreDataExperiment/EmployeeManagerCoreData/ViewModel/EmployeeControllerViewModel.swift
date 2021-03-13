//
//  EmployeeControllerViewModel.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import Foundation


class EmployeeControllerViewModel {
    var employeesModelArray: [Employee] = []
    
    func fetchEmployees() -> [Employee] {
        return CoreDataManager.shared.fetchEmployees()
    }
}
