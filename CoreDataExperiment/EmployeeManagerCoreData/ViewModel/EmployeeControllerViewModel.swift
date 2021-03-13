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
        var employeeModelArray: [EmployeeViewModel] = []
        let employees = CoreDataManager.shared.fetchEmployees()
        for employee in employees {
            employeeModelArray.append(EmployeeViewModel.init(name: employee.name ?? "", number: employee.id ?? "", designation: employee.designation ?? ""))
        }
        return employeeModelArray
    }
}
