//
//  ApiServiceDiscount.swift
//  Shopify
//
//  Created by Macintosh on 08/07/2022.
//

import Foundation

//

import Foundation
protocol ApiServiceChooseDiscount {
    func fetchDiscount(endPoint : String , Completion : @escaping (([PriceRule]? , Error?) -> Void))
}
