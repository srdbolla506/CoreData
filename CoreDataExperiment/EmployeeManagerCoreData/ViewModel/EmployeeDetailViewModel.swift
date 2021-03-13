//
//  EmployeeDetailViewModel.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import Foundation

class EmployeeDetailViewModel {
    var employee: Employee?
    
    var employeeName: String? = ""
    var employeeNumber: String? = ""
    var employeeLocation: String? = ""
    var employeeAddress: String? = ""
    var employeeDesignation: String? = ""
    var employeePhone: String? = ""
    
    init() {
        
    }
    
    func saveEmployeeDetails() {
        if employee == nil {
            employee = CoreDataManager.shared.insertEMployeeAndReturn()
        }
        employee?.id = employeeNumber
        employee?.name = employeeName
        employee?.address = employeeAddress
        employee?.location = employeeLocation
        employee?.phone = employeePhone
        employee?.designation = employeeDesignation
            
        CoreDataManager.shared.saveEmployee(employee: employee)
    }
}
