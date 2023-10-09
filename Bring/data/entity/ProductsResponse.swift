//
//  ProductsResponse.swift
//  Bring
//
//  Created by Tolga Sarikaya on 09.10.23.
//

import Foundation

class ProductsResponse : Codable {
    var yemekler: [Product]?
    var success: Int?
}
