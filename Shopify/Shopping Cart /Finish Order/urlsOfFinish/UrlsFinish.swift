//
//  UrlsFinish.swift
//  Shopify
//
//  Created by Macintosh on 08/07/2022.
//

// {{link}}/admin/api/2022-07/discount_codes/lookup.json?code=SUMMERSALE10OFF

//https://7d67dd63dc90e18fce08d1f7746e9f41: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@ios-q3-mansoura.myshopify.com/admin/api/2022-07/discount_codes/lookup.json?code=SUMMERSALE10OFF


// https://ios-q3-mansoura.myshopify.com//admin/api/2022-07/price_rules.json


import Foundation
struct UrlServiceOfDiscount {
    var endPoint : String = ""
    var url : String {
        return "https://7d67dd63dc90e18fce08d1f7746e9f41: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@ios-q3-mansoura.myshopify.com/admin/api/2022-07/\(endPoint)"
    }
}
