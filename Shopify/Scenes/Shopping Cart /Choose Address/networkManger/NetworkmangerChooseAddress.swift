//
//  NetworkmangerChooseAddress.swift
//  Shopify
//
//  Created by Macintosh on 07/07/2022.
//

import Foundation
class NetworkMangerChooseAddress : ApiServiceChooseAddress {
    func fetchAddresses(endPoint: Int, Completion: @escaping (([AddressI]?, Error?) -> Void)) {
        var arrayOfBranchs = [AddressI]()
        
        if let url = URL(string: UrlServiceOfAddress(endPoint: "\(endPoint)").url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let insideData = data {
                    print(insideData)
                    let decodeArray : AddressesI? = convertFromJson(data: insideData)
                    arrayOfBranchs = decodeArray?.addresses ?? []
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
