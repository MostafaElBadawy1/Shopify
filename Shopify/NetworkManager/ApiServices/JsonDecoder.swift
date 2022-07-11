//
//  JsonDecoder.swift
//  Shopify
//
//  Created by Ahmed on 04/07/2022.
//

import Foundation

func convertFromJson<T: Codable>(data : Data) -> T? {
    print("decode data")
    let jsonDecoder = JSONDecoder()
    let decodeArray = try? jsonDecoder.decode(T.self, from: data)
    return decodeArray
}


