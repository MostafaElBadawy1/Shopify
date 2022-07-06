//
//  ProductViewModel.swift
//  Shopify
//
//  Created by Ahmed on 05/07/2022.
//

import Foundation
class ProductViewModel {

var productArray: [Product]? {
    didSet {
        bindingData(productArray,nil)
    }
}
var error: Error? {
    didSet {
        bindingData(nil, error)
    }
}
let apiService : ApiService  // create api service object
var bindingData: (([Product]?,Error?) -> Void) = {_, _ in }
init(apiService: ApiService = NetworkManger()) {
    self.apiService = apiService
}



    func fetchData(endPoint:String) {
    apiService.fetchProduct(endPoint:endPoint ) { products, error in
        if let products = products {
            self.productArray = products
        }
        
        if let error = error {
            self.error = error
        }
        
    }

}
}


