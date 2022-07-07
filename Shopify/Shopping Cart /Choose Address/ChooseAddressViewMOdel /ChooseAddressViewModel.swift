//
//  ChooseAddressViewModel.swift
//  Shopify
//
//  Created by Macintosh on 07/07/2022.
//

import Foundation
class HomeViewModelAddress {
    
    var idcustomer : Int
    
    var Addressarray: [Address]? {
        didSet {
            bindingData(Addressarray,nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    let apiService : ApiServiceChooseAddress  // create api service object
    var bindingData: (([Address]?,Error?) -> Void) = {_, _ in }
    init(apiService: ApiServiceChooseAddress = NetworkMangerChooseAddress() , customerid : Int) {
        self.apiService = apiService
        self.idcustomer = customerid
    }
    
    
    
    func fetchData() {
        
        apiService.fetchAddresses(endPoint: idcustomer) { addresses, error in
            if let addresses = addresses {
                self.Addressarray = addresses
            }
            
            if let error = error {
                self.error = error
            }
            
        }
        
    }
    
    
    
}
