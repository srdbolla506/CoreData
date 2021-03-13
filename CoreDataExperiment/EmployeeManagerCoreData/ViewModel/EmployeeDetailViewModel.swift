//
//  EmployeeDetailViewModel.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import Foundation

class EmployeeDetailViewModel {
    var employee: Employee?
    
    var employeeName: String = ""
    var employeeNumber: String = ""
    var employeeLocation: String = ""
    var employeeAddress: String = ""
    var employeeDesignation: String = ""
    var employeePhone: String = ""
    
    init() {
        
    }
    
    func saveEmployeeDetails() {
        let createdEmployeeObject = CoreDataManager.shared.insertEMployeeAndReturn()
        createdEmployeeObject?.id = employeeNumber
        createdEmployeeObject?.name = employeeName
        createdEmployeeObject?.address = employeeAddress
        createdEmployeeObject?.location = employeeLocation
        createdEmployeeObject?.phone = employeePhone
        createdEmployeeObject?.designation = employeeDesignation
            
        CoreDataManager.shared.saveEmployee(employee: createdEmployeeObject)
    }
}
