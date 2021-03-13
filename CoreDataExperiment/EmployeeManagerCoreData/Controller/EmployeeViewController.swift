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
        
        self.configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureViewModel()
        self.tableView.reloadData()
    }
    
    
    @IBAction func addEmployeeAction(_ sender: UIBarButtonItem) {
        guard let detailViewController = UIStoryboard.init(name: storyboardName, bundle: nil).instantiateViewController(identifier: EmployeeDetailViewController.Constants.identifier) as? EmployeeDetailViewController else {
            return
        }
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func configureViewModel() {
        self.employeeControllerViewModel.employeesModelArray = self.employeeControllerViewModel.fetchEmployees()
    }
    
    func configureTableView() {
        tableView.register(UINib.init(nibName: EmployeeTableViewCell.Constants.identifier, bundle: nil), forCellReuseIdentifier: EmployeeTableViewCell.Constants.identifier)
        tableView.tableFooterView = UIView()
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
        employeeTableViewCell.configureCell(employee: employeeControllerViewModel.employeesModelArray[indexPath.row])
        
        return employeeTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = UIStoryboard.init(name: storyboardName, bundle: nil).instantiateViewController(identifier: EmployeeDetailViewController.Constants.identifier) as? EmployeeDetailViewController else {
            return
        }
        detailViewController.employeeDetailViewModel.employee = employeeControllerViewModel.employeesModelArray[indexPath.row]
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}


