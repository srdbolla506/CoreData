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
    
    
}
