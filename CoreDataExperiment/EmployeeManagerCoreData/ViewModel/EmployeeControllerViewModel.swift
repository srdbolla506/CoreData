//
//  EmployeeControllerViewModel.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import Foundation


class EmployeeControllerViewModel {
    var employeesModelArray: [EmployeeViewModel] = []
    
    func fetchEmployees() -> [EmployeeViewModel] {
        var employeeViewModelArray: [EmployeeViewModel] = []
        let employees = CoreDataManager.shared.fetchEmployees()
        for employee in employees {
            employeeViewModelArray.append(EmployeeViewModel.init(employee: employee))
        }
        return employeeViewModelArray
    }
}
