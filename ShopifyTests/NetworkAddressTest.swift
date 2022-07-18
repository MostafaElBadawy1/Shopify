//
//  NetworkAddressTest.swift
//  ShopifyTests
//
//  Created by Macintosh on 18/07/2022.
//

import XCTest
@testable import Shopify



class NetworkAddressTest: XCTestCase {

    var apiservice : ApiServiceChooseAddress!
    
    override func setUp() {
        apiservice = AddressNetworkMangerMock(shouldReturnError: false)
        
    }
    
    override  func tearDown() {
        apiservice = nil
    }
    
    func testFectchingaddresess(){
        
        apiservice.fetchAddresses(endPoint: 6261211300054) { addresses, error in
            XCTAssertEqual(addresses?.count ?? 0,3)
        }
        
    }
}
