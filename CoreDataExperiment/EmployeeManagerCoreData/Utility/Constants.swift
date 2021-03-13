//
//  Constants.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import Foundation

extension EmployeeTableViewCell {
    enum Constants {
        static let identifier = "EmployeeTableViewCell"
    }
}

extension DetailTextFieldCell {
    enum Constants {
        static let identifier = "DetailTextFieldCell"
    }
}

extension EmployeeDetailViewController {
    enum Constants {
        static let identifier = "EmployeeDetailViewController"
    }
}

let storyboardName = "Main"


enum EmployeeFields: String, CaseIterable {
    case name = "Employee Name"
    case number = "Employee Number"
    case address = "Employee Address"
    case location = "Employee Location"
    case designation = "Employee Designation"
    case phone = "Employee Phone Number"
}
