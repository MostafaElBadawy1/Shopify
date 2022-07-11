//
//  ApiServiceChooseAddress.swift
//  Shopify
//
//  Created by Macintosh on 07/07/2022.
//

import Foundation
protocol ApiServiceChooseAddress {
    func fetchAddresses(endPoint : Int , Completion : @escaping (([Address]? , Error?) -> Void))
}
