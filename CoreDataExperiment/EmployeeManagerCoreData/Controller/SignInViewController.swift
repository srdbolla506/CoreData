//
//  SignInViewController.swift
//  EmployeeManagerCoreData
//
//  Created by Sri Divya Bolla on 13/03/21.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var signInViewModel: SignInViewModel = SignInViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.retrieveCredentialsFromKeychain()
    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        if  usernameTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0 {
            self.signInViewModel.storeCredentialsInKeychain(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "", server: "employeemanager.com")
            
            self.performSegue(withIdentifier: "showMainStoryboardSegue", sender: sender)
        } else {
            let alertController: UIAlertController = UIAlertController.init(title: "Please enter the username and password to login", message: "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func retrieveCredentialsFromKeychain() {
        (usernameTextField.text, passwordTextField.text) = self.signInViewModel.retrieveCredentialsFromKeychain(server: "employeemanager.com")
    }
}
