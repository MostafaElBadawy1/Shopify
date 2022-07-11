//
//  RegisterViewModel.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 05/07/2022.
//

import Foundation

class AuthenticationViewModel {
    let ApiService: ApiService
    init(ApiService: ApiService = NetworkManger()) {
        self.ApiService = ApiService
    }
    func createNewCustomer(newCustomer: NewCustomer, completion:@escaping (Data?, URLResponse? , Error?)->()){
        ApiService.registerCustomer(endPoint: "customers.json", newCustomer: newCustomer) { data, response, error in
            if error == nil {
                guard let data = data else {return}
                let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String,Any>
                let customer = json["customer"] as? Dictionary<String,Any>
                let customerID = customer?["id"] as? Int ?? 0
                let customerFirstName = customer?["first_name"] as? String ?? ""
                let customerLastName = customer?["last_name"] as? String ?? ""
                let customerEmail = customer?["email"] as? String ?? ""
                Helper.shared.setUserID(customerID: customerID)
                Helper.shared.setUserName(userName: "\(customerFirstName) \(customerLastName)")
                Helper.shared.setUserEmail(userEmail: customerEmail)
                Helper.shared.setUserStatus(userIsLogged: true)
                completion(data, response, nil)
            }else{
                completion(nil, nil, error)
            }
        }
    }
    
    func checkUserIsLogged(email: String, password: String, completion: @escaping (Customer?)-> Void){
        ApiService.getAllCustomers(endPoint: "customers.json") { customers, error in
            guard let customers = customers, error == nil else {return}
            
            let filetr = customers.customers.filter { selectedCustomer in
                return selectedCustomer.email == email && selectedCustomer.tags == password
            }
            if filetr.count != 0{
                Helper.shared.setUserStatus(userIsLogged: true)
                guard let customerID = filetr[0].id, let userFirstName = filetr[0].first_name, let userLastName = filetr[0].last_name, let userEmail = filetr[0].email  else {return}
                Helper.shared.setUserID(customerID: customerID)
                Helper.shared.setUserName(userName: "\(userFirstName) \(userLastName)")
                Helper.shared.setUserEmail(userEmail: userEmail)
                if !filetr[0].addresses!.isEmpty {
                    Helper.shared.setFoundAdress(isFoundAddress: true)
                }
                completion(filetr[0])
            }else{
                completion(nil)
            }
        }
    }
    
    func checkUserIsLogged(email: String, completion: @escaping (Customer?)-> Void){
        ApiService.getAllCustomers(endPoint: "customers.json") { customers, error in
            guard let customers = customers, error == nil else {return}
            
            let filetr = customers.customers.filter { selectedCustomer in
                return selectedCustomer.email == email
            }
            if filetr.count != 0{
                print(filetr.count)
                completion(filetr[0])
            }else{
                completion(nil)
            }
        }
    }
    
    func checkUserIsExist(email: String, completion: @escaping (Bool)-> Void){
        checkUserIsLogged(email: email) { customer in
            guard customer != nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
}
