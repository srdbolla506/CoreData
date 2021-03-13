//
//  ViewController.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var employeeControllerViewModel: EmployeeControllerViewModel = EmployeeControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureViewModel()
        self.tableView.reloadData()
    }
    
    func configureViewModel() {
        self.employeeControllerViewModel.employeesModelArray = self.employeeControllerViewModel.fetchEmployees()
    }
}

extension EmployeeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeControllerViewModel.employeesModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let employeeTableViewCell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.Constants.identifier, for: indexPath) as? EmployeeTableViewCell else {
            return UITableViewCell()
        }
        employeeTableViewCell.configureCell(employeeViewModel: employeeControllerViewModel.employeesModelArray[indexPath.row])
        
        return employeeTableViewCell
    }
    
    
}


