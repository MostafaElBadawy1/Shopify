//
//  SignUpViewController.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 13/07/2022.
//

import UIKit

class SignUpViewController: UIViewController {
    func styleOfBtn(){
        signUpButton.layer.cornerRadius = 20
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.black.cgColor
        signUpButton.layer.shadowColor = UIColor.white.cgColor
        signUpButton.layer.shadowOpacity = 0.0
            signUpButton.layer.shadowColor = nil
            signUpButton.layer.shadowRadius = 0.0
       
        
    }
    // MARK: - Propreties
    var networkIndicator = UIActivityIndicatorView()
    var customes = [Customer]()
    // MARK: - IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    // MARK: - IBActions
    @IBAction func signUpAction(_ sender: Any) {
        guard let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else { return }
        
        register()
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        styleOfBtn()
    }
    // MARK: - Register
    func register(){
        guard let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let email = emailTextField.text,
              let password = passwordTextField.text else {return}
        let customer = Customer(first_name: firstName, last_name: lastName, email: email, phone: nil, tags: password, id: nil, verified_email: true, addresses: nil)
        let newCustomer = NewCustomer(customer: customer)
        if checkUserIsExist(email: email) {
        }else{
            let signUpViewModel = SignUpViewModel(endpoint: "customers.json")
            signUpViewModel.createNewCustomer(newCustomer: newCustomer) { data, response, error in
                guard error == nil else {
                    print("error")
                    return
                }
                guard let data = data else {
                    return
                }
                print(data)
            }
            print("register is success")
        }
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarHome")
        }
    }
}
// MARK: - SignUp
extension SignUpViewController {
    func checkUserIsExist(email: String) -> Bool {
        guard let customer = customes.first(where: {$0.email ==  email}) else { return false}
        return true
    }
}
