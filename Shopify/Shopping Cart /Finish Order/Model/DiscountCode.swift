//
//  DiscountCode.swift
//  Shopify
//
//  Created by Macintosh on 08/07/2022.
//

import Foundation


// MARK: - Welcome
struct Discounts : Codable {
    let priceRules: [PriceRule]
}

// MARK: - PriceRule
struct PriceRule : Codable {
    let id: Int
    let valueType, value, customerSelection, targetType: String
    let targetSelection, allocationMethod: String
    let oncePerCustomer: Bool
    let startsAt: Date
    let createdAt, updatedAt: Date
    let title, adminGraphqlAPIID: String
}

// MARK: - PrerequisiteToEntitlementPurchase
struct PrerequisiteToEntitlementPurchase {
    let prerequisiteAmount: NSNull
}

// MARK: - PrerequisiteToEntitlementQuantityRatio
struct PrerequisiteToEntitlementQuantityRatio {
    let prerequisiteQuantity, entitledQuantity: NSNull
}
