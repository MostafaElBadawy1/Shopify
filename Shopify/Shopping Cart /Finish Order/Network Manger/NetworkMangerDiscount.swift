//
//  NetworkMangerDiscount.swift
//  Shopify
//
//  Created by Macintosh on 08/07/2022.
//

import Foundation

class NetworkMangerDiscount : ApiServiceChooseDiscount {
    func fetchDiscount(endPoint: String, Completion: @escaping (([PriceRule]?, Error?) -> Void)) {
        var arrayOfBranchs = [PriceRule]()
        print("\(String(describing: URL(string: UrlServiceOfDiscount(endPoint: "\(endPoint)").url)))")
        if let url = URL(string: UrlServiceOfDiscount(endPoint: "\(endPoint)").url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let insideData = data {
                    print(insideData)
                    let decodeArray : Discounts? = convertFromJson(data: insideData)
                    print(decodeArray?.priceRules)
                    arrayOfBranchs = decodeArray?.priceRules ?? []
                    print("decode array \(arrayOfBranchs)")
                    Completion(arrayOfBranchs , nil)
                }
                if let errorInside = error {
                    Completion(nil , errorInside)
                }
            }.resume()
        }
    }
    
    }
    

    
   

