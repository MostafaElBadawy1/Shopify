//
//  LoginViewController.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 13/07/2022.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Propreties
    var networkIndicator = UIActivityIndicatorView()
    var customes = [Customer]()
    func styleOfBtn(){
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.shadowColor = UIColor.white.cgColor
        loginButton.layer.shadowOpacity = 0.0
            loginButton.layer.shadowColor = nil
            loginButton.layer.shadowRadius = 0.0
       
        
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    // MARK: - IBActions
    @IBAction func loginAction(_ sender: Any) {
        print("login")
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            showAlert(message: "Complete all data first .")
            
            return
        }
        if let customer = customes.first(where: {$0.email == email && $0.tags == password}) {
            Helper.shared.setUserStatus(userIsLogged: true)
            Helper.shared.setUserID(customerID: customer.id)
            Helper.shared.setUserEmail(userEmail: customer.email)
            Helper.shared.setUserName(userName: customer.first_name)
            let allAddresses = customer.addresses
            let addresses = allAddresses?.isEmpty
            if addresses! {
                Helper.shared.setFoundAdress(isFoundAddress: false)
            }
            else {
                Helper.shared.setFoundAdress(isFoundAddress: true)
            }
            print("loged in success")
            let alert = UIAlertController(title: "Loggin Successfuly", message: "you are loggin" , preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.async {
                UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarHome")
            }
        }else{
            showAlert(message: "No customer with this data .")
        }
    }
    @IBAction func forgetPasswordAction(_ sender: Any) {
    }
    @IBAction func signUpAction(_ sender: Any) {
        
        let signupViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        signupViewController.customes = customes
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        styleOfBtn()
        getCustomers()
    }
    override func viewWillAppear(_ animated: Bool) {
        getCustomers()
        for i in customes {
            print(i.first_name)
        }
    }
    func showAlert(message : String){

            let alert = UIAlertController(title: "Some thing wronge", message: message , preferredStyle: .actionSheet)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true, completion: nil)
    }
   
}
extension LoginViewController {
    func getCustomers(){
        let loginViewModel = LoginViewModel(endpoint: "customers.json")
        loginViewModel.fetchData()
        loginViewModel.bindingData = { [weak self] customers , error in
            guard let self = self else {return}
            if let customers = customers {
                DispatchQueue.main.async {
                    self.networkIndicator.stopAnimating()
                    self.customes = customers
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
  
