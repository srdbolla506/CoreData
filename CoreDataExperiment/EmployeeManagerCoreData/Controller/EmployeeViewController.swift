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
        // Do any additional setup after loading the view.
    }
}

extension EmployeeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeControllerViewModel.employeesModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.de
        return UITableViewCell()
    }
    
    
}


