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
    
    func saveEmployee(employee: EmployeeViewModel) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let moc = appDelegate?.persistentContainer.viewContext else {
            return
        }

        let employeeNewlyCreated = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: moc) as? Employee

        employeeNewlyCreated?.id = employee.number
        employeeNewlyCreated?.name = employee.name
        employeeNewlyCreated?.address = employee.address
        employeeNewlyCreated?.phone = employee.phone
        employeeNewlyCreated?.designation = employee.designation
        employeeNewlyCreated?.location = employee.location
        
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
    
    func createOrUpdateEmployee(employeeViewModel: EmployeeViewModel) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let moc = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        let fetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
        fetchRequest.predicate = NSPredicate.init(format: "id = %@", employeeViewModel.number)
        
        do {
            let employees = try moc.fetch(fetchRequest)
            var newlyCreatedEmployee: Employee?
            if employees.count > 0 {
                newlyCreatedEmployee = employees[0]
            } else {
                newlyCreatedEmployee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: moc) as? Employee
            }
            
            newlyCreatedEmployee?.id = employeeViewModel.number
            newlyCreatedEmployee?.name = employeeViewModel.name
            newlyCreatedEmployee?.address = employeeViewModel.address
            newlyCreatedEmployee?.location = employeeViewModel.location
            newlyCreatedEmployee?.phone = employeeViewModel.phone
            newlyCreatedEmployee?.designation = employeeViewModel.designation
            
        } catch let error {
            print(error)
        }
        appDelegate?.saveContext()

    }
    
    func deleteEmployeeDetails(employeeViewModel: EmployeeViewModel) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let moc = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        let fetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
        fetchRequest.predicate = NSPredicate.init(format: "id = %@", employeeViewModel.number)
        
        do {
            let employees = try moc.fetch(fetchRequest)
            if employees.count > 0 {
                let employee = employees[0]
                moc.delete(employee)
            }
        } catch _ {
            
        }

        appDelegate?.saveContext()
    }
    
    
}
