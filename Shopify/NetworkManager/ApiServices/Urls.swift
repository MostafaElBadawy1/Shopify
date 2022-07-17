//
//  Url.swift
//  Shopify
//
//  Created by Ahmed on 04/07/2022.
//

import Foundation
struct UrlService {
    var endPoint : String = ""
    var url : String {
        return "https://7d67dd63dc90e18fce08d1f7746e9f41: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@ios-q3-mansoura.myshopify.com/admin/api/2022-04/\(endPoint)"
    }
//https://ios-q3-mansoura.myshopify.com/admin/api/2022-04/products.json?
   
    func addAddressToCustomer(id: String) -> URL? {
        return URL(string: url + "customers/\(id).json")
    }
}


//products.json
