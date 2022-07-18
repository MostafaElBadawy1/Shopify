//
//  MyProfileViewController.swift
//  BasicStructure
//
//  Created by Ibrahem's on 15/07/2022.
//

import UIKit

class GuestProfileViewController: UIViewController {

    @IBOutlet weak var loginA: UIButton!
    
    @IBOutlet weak var registerA: UIButton!
    
    func styleOfBtn(){
        loginA.layer.cornerRadius = 20
        loginA.layer.borderWidth = 1
        loginA.layer.borderColor = UIColor.black.cgColor
        loginA.layer.shadowColor = UIColor.white.cgColor
        loginA.layer.shadowOpacity = 0.0
            loginA.layer.shadowColor = nil
            loginA.layer.shadowRadius = 0.0
        registerA.layer.shadowOpacity = 0.0
            registerA.layer.shadowColor = nil
            registerA.layer.shadowRadius = 0.0
        registerA.layer.cornerRadius = 20
        registerA.layer.borderWidth = 1
        registerA.layer.borderColor = UIColor.black.cgColor
        
       
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        styleOfBtn()
        self.navigationItem.hidesBackButton = true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func navigateToLogIn(_ sender: Any) {
     /*
        let loginScreen = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        self.navigationController?.pushViewController(loginScreen, animated: true)*/
       
    }
    
    @IBAction func navigateToRegister(_ sender: Any) {
    /*
        let signUpScreen = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        self.navigationController?.pushViewController(signUpScreen, animated: true)*/
    }
    

}
