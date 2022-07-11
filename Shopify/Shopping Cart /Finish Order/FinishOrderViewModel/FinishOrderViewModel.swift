//
//  FinishOrderViewModel.swift
//  Shopify
//
//  Created by Macintosh on 08/07/2022.
//

import Foundation

class HomeViewModelFinishOrder {
    
    var CouponTxt : String
    
    var discount: [PriceRule]? {
        didSet {
            bindingData(discount, nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    let apiService : ApiServiceChooseDiscount  // create api service object
    var bindingData: (([PriceRule]?,Error?) -> Void) = {_, _ in }
    init(apiService: ApiServiceChooseDiscount = NetworkMangerDiscount() , coupountxt : String) {
        self.apiService = apiService
        self.CouponTxt = coupountxt
    }
    
    
    
    func fetchData() {
        
        apiService.fetchDiscount(endPoint: CouponTxt, Completion: { discount, error in
            if let discount = discount {
                self.discount = discount
            }
            
            if let error = error {
                self.error = error
            }
            
        }
        
    )}
    
    
    
}
