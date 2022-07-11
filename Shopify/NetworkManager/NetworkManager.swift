//
//  NetworkManager.swift
//  Shopify
//
//  Created by Ahmed on 04/07/2022.
//

import Foundation
import Alamofire
class NetworkManger : ApiService {
    
    func fetchbranchs(endPoint: String, Completion: @escaping (([SmartCollection]?, Error?) -> Void)) {
        var arrayOfBranchs = [SmartCollection]()
        
        if let url = URL(string: UrlService(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let insideData = data {
                    // print(insideData)
                    let decodeArray : SmartCollectionsModel? = convertFromJson(data: insideData)
                    arrayOfBranchs = decodeArray!.smart_collections
                    //print("decode array \(arrayOfBranchs)")
                    Completion(arrayOfBranchs , nil)
                }
                if let errorInside = error {
                    Completion(nil , errorInside)
                }
            }.resume()
        }
    }
    
    
}


extension NetworkManger{
    func registerCustomer(endPoint: String ,newCustomer:NewCustomer, completion:@escaping (Data?, URLResponse? , Error?)->()){
        guard let url = URL(string: UrlService(endPoint: endPoint).url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let session = URLSession.shared
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: newCustomer.asDictionary(), options: .prettyPrinted)
            print(try! newCustomer.asDictionary())
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        session.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
}

extension NetworkManger {
    
    func getAllCustomers(endPoint: String, complition: @escaping (Customers?, Error?)->Void){
        guard let url = URL(string: UrlService(endPoint: endPoint).url) else {return}
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { res in

            switch res.result{
            case .failure(let error):
                print("error")
                complition(nil, error)
            case .success(_):

                guard let data = res.data else { return }
                do{
                    let json = try JSONDecoder().decode(Customers.self, from: data)
                    complition(json, nil)
                    print("success to get customers")
                }catch let error{
                    print("error when get customers")
                    complition(nil, error)
                }
            }
        }
    }
}
