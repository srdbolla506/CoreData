//
//  Employee+CoreDataProperties.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var address: String?
    @NSManaged public var designation: String?
    @NSManaged public var id: String?
    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var manager: Manager?

}

extension Employee : Identifiable {

}
