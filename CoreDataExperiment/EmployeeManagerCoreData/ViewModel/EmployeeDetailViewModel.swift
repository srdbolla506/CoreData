//
//  EmployeeDetailViewModel.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import Foundation

class EmployeeDetailViewModel {
    var employee: EmployeeViewModel
        
    init() {
        employee = EmployeeViewModel()
    }
    
    func saveEmployeeDetails() {
        CoreDataManager.shared.createOrUpdateEmployee(employeeViewModel: employee)
    }

    func deleteEmployeeDetails() {
        CoreDataManager.shared.deleteEmployeeDetails(employeeViewModel: employee)
    }
}
