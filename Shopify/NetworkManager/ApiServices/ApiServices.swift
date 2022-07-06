//
//  ApiServices.swift
//  Shopify
//
//  Created by Ahmed on 04/07/2022.
//

import Foundation
protocol ApiService {
    func fetchbranchs(endPoint : String , Completion : @escaping (([SmartCollection]? , Error?) -> Void))
    
    func fetchProduct(endPoint : String , Completion : @escaping (([Product]? , Error?) -> Void))
}
