//
//  CoreDataManager.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import UIKit
import CoreData


class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {
    }
    
    func fetchEmployees() -> [Employee] {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let moc = appDelegate?.persistentContainer.viewContext else {
            return []
        }
        
        let fetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
        
        do {
            let employees = try moc.fetch(fetchRequest)
            return employees
        } catch let error {
            print(error)
        }
        
        return []
    }
    
    func saveEmployee(employee: Employee?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
//        guard let moc = appDelegate?.persistentContainer.viewContext else {
//            return
//        }
//
//        let employeeNewlyCreated = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: moc) as? Employee
//
//        employeeNewlyCreated?.id = employee?.id
//        employeeNewlyCreated?.name = employee?.name
//        employeeNewlyCreated?.address = employee?.address
//        employeeNewlyCreated?.phone = employee?.phone
//        employeeNewlyCreated?.designation = employee?.designation
//        employeeNewlyCreated?.location = employee?.location
        
        appDelegate?.saveContext()
    }
    
    func insertEMployeeAndReturn() -> Employee? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let moc = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
            
        let employeeNewlyCreated = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: moc) as? Employee
        
        return employeeNewlyCreated
    }
    
}
