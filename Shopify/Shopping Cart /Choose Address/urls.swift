//
//  urls.swift
//  Shopify
//
//  Created by Macintosh on 07/07/2022.
//



//https://7d67dd63dc90e18fce08d1f7746e9f41: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@ios-q3-mansoura.myshopify.com/admin/api/2022-01/customers/6261211300054/addresses.json

import Foundation
struct UrlServiceOfAddress {
    var endPoint : String = ""
    var url : String {
        return "https://7d67dd63dc90e18fce08d1f7746e9f41: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@ios-q3-mansoura.myshopify.com/admin/api/2022-01/customers/\(endPoint)/addresses.json"
    }
}
