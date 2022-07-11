//
//  LoginViewController.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 05/07/2022.
//

import UIKit

class LoginViewController: UIViewController {
    var authenticationViewModel = AuthenticationViewModel()

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBAction func loginBtn(_ sender: UIButton) {
        loginUser()
    }

    @IBAction func goTosignUpVCBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func loginUser(){
        guard let email = emailTF.text else {return}
        guard let password = passwordTF.text else {return}
        authenticationViewModel.checkUserIsLogged(email: email, password: password) { [self] customerLogged in
            if customerLogged != nil {
                DispatchQueue.main.async {
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                    let nav = UINavigationController(rootViewController: vc)
                    nav.modalPresentationStyle = .fullScreen
                    self.present(nav, animated: true, completion: nil)
                }
            }else{
                Helper.shared.setUserStatus(userIsLogged: false)
                self.showAlertError(title: "failed to login", message: "Please check your email or password")
            }
        }
    }


}
