//
//  EmployeeDetailViewController.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import UIKit

class EmployeeDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var employeeDetailViewModel: EmployeeDetailViewModel = EmployeeDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        self.tableView.reloadData()
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        self.employeeDetailViewModel.saveEmployeeDetails()
        self.navigationController?.popViewController(animated: true)
    }
    
    func configureTableView() {
        tableView.register(UINib.init(nibName: DetailTextFieldCell.Constants.identifier, bundle: nil), forCellReuseIdentifier: DetailTextFieldCell.Constants.identifier)
        tableView.separatorColor = UIColor.clear
        tableView.tableFooterView = UIView()
    }

}

extension EmployeeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmployeeFields.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let detailTextFieldCell = tableView.dequeueReusableCell(withIdentifier: DetailTextFieldCell.Constants.identifier, for: indexPath) as? DetailTextFieldCell else {
            return UITableViewCell()
        }
        detailTextFieldCell.textField.placeholder = EmployeeFields.allCases[indexPath.row].rawValue
        
        self.populateTableViewCellsWithDataFor(tableViewCell: detailTextFieldCell)
        
        detailTextFieldCell.textField.delegate = self
        
        return detailTextFieldCell
    }
}

extension EmployeeDetailViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.placeholder {
        case EmployeeFields.number.rawValue:
            employeeDetailViewModel.employee.number = textField.text ?? ""
            break
            
        case EmployeeFields.name.rawValue:
            employeeDetailViewModel.employee.name = textField.text ?? ""
            break
            
        case EmployeeFields.phone.rawValue:
            employeeDetailViewModel.employee.phone = textField.text ?? ""
            break
            
        case EmployeeFields.address.rawValue:
            employeeDetailViewModel.employee.address = textField.text ?? ""
            break
            
        case EmployeeFields.location.rawValue:
            employeeDetailViewModel.employee.location = textField.text ?? ""
            break

        case EmployeeFields.designation.rawValue:
            employeeDetailViewModel.employee.designation = textField.text ?? ""
            break

        default:
            break

        }
    }
}

extension EmployeeDetailViewController {
    func populateTableViewCellsWithDataFor(tableViewCell: DetailTextFieldCell) {
        tableViewCell.textField.isUserInteractionEnabled = true
        switch tableViewCell.textField.placeholder {
        case EmployeeFields.number.rawValue:
            tableViewCell.textField.text = employeeDetailViewModel.employee.number
            if employeeDetailViewModel.employee.number.count > 0 {
                tableViewCell.textField.isUserInteractionEnabled = false
            }
            break
            
        case EmployeeFields.name.rawValue:
            tableViewCell.textField.text = employeeDetailViewModel.employee.name
            break
            
        case EmployeeFields.phone.rawValue:
            tableViewCell.textField.text = employeeDetailViewModel.employee.phone
            break
            
        case EmployeeFields.address.rawValue:
            tableViewCell.textField.text = employeeDetailViewModel.employee.address
            break
            
        case EmployeeFields.location.rawValue:
            tableViewCell.textField.text = employeeDetailViewModel.employee.location
            break

        case EmployeeFields.designation.rawValue:
            tableViewCell.textField.text = employeeDetailViewModel.employee.designation
            break

        default:
            break

        }

    }
}
