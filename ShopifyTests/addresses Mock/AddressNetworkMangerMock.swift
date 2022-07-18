//
//  AddressNetworkMangerMock.swift
//  ShopifyTests
//
//  Created by Macintosh on 18/07/2022.
//

import Foundation
@testable import Shopify


class AddressNetworkMangerMock : ApiServiceChooseAddress {
    
    
    var shouldReturnError: Bool
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    
    
    let jsonResponse: [String: [Any]] =
    [
       "addresses":[
          [
             "id":7757831241942,
             "customer_id":6261211300054,
             "first_name":"Mohamed Elkazzaz",
             "last_name":"",
             "address1":"5th statment",
             "city":"Cairo",
             "province":"",
             "country":"Egypt",
             "zip":"",
             "phone":"01234567890",
             "name":"Mohamed Elkazzaz",
             "country_code":"EG",
             "country_name":"Egypt",
             "default":true
          ],
          [
             "id":7766992683222,
             "customer_id":6261211300054,
             "first_name":"Mohamed",
             "last_name":"Elkazzaz",
             "address1":"Qweasdzxc",
             "city":"Man",
             "province":"Cairo",
             "country":"Egypt",
             "zip":"",
             "phone":"01232456543",
             "name":"Mohamed Elkazzaz",
             "province_code":"C",
             "country_code":"EG",
             "country_name":"Egypt",
             "default":false
          ],
          [
             "id":7768157454550,
             "customer_id":6261211300054,
             "first_name":"Mohamed",
             "last_name":"Elkazzaz",
             "address1":"Asdqwezxcasdfr",
             "city":"Nasr Ciry",
             "province":"Cairo",
             "country":"Egypt",
             "zip":"",
             "phone":"01234323456",
             "name":"Mohamed Elkazzaz",
             "province_code":"C",
             "country_code":"EG",
             "country_name":"Egypt",
             "default":false
          ]
       ]
    ]
    

    
    
    
    func fetchAddresses(endPoint: Int, Completion: @escaping (([AddressI]?, Error?) -> Void)) {
        switch shouldReturnError {
        case true :
            Completion(nil , NetworkError.failedFetchingData)
        case false :
      
            if let data = try? JSONSerialization.data(withJSONObject: jsonResponse, options: .fragmentsAllowed){
                if let decodedObject : AddressesI = convertFromJson(data: data){
                    Completion(decodedObject.addresses,nil)
                    
                }else{
                    Completion(nil , NetworkError.failedFetchingData)
                }
            }else {
                Completion(nil , NetworkError.failedFetchingData)
            }
            
        }
    }
    
}



enum NetworkError : Error {
    case failedFetchingData
}
