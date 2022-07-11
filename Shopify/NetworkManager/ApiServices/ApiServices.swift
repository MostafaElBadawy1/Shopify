//
//  ApiServices.swift
//  Shopify
//
//  Created by Ahmed on 04/07/2022.
//

import Foundation
protocol ApiService {
    func fetchbranchs(endPoint : String , Completion : @escaping (([SmartCollection]? , Error?) -> Void))
    func getAllCustomers(endPoint: String, complition: @escaping (Customers?, Error?)->Void)
    func registerCustomer(endPoint: String ,newCustomer:NewCustomer, completion:@escaping (Data?, URLResponse? , Error?)->())
}
