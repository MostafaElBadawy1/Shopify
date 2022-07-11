//
//  RegisterViewController.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 05/07/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    var authenticationViewModel = AuthenticationViewModel()

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBAction func signUpBtn(_ sender: UIButton) {
        registeringNewUser()
    }
    @IBAction func goToLoginVCBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    func registeringNewUser() {
        guard let firstName = firstNameTF.text, let lastName = lastNameTF.text, let email = emailTF.text,
              let password = passwordTF.text else {return}
        let customer = Customer(first_name: firstName, last_name: lastName, email: email, phone: nil, tags: password, id: nil, verified_email: true, addresses: nil)
        let newCustomer = NewCustomer(customer: customer)
        authenticationViewModel.checkUserIsExist(email: email) { emailIsExist in
            if !emailIsExist{
                self.authenticationViewModel.createNewCustomer(newCustomer: newCustomer) { data, response, error in
                    guard error == nil else {
                        return
                    }
                    DispatchQueue.main.async {
                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                        let navigationController = UINavigationController(rootViewController: vc)
                        navigationController.modalPresentationStyle = .fullScreen
                        self.present(navigationController, animated: true, completion: nil)
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.showAlertError(title: "your email is already exist", message: "Please Login")
                }
            }
        }
    }

   

}
