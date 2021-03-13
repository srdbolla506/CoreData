//
//  EmployeeTableViewCell.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var employeeNumber: UILabel!
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeDesignation: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(employeeViewModel: EmployeeViewModel) {
        self.employeeNumber.text = employeeViewModel.number
        self.employeeName.text = employeeViewModel.name
        self.employeeDesignation.text = employeeViewModel.designation
    }

}
