//
//  Products.swift
//  ShopApp_ITI
//
//  Created by Zeinab on 27/02/2023.
//

import Foundation

struct ProductsResult : Codable {
    var products : [Products]
}

struct Products : Codable {
    var id : Int
    var title : String
    var body_html : String?
    var vendor : String
    var product_type : String
    var handle : String?
    var status : String
    var variants : [Variant]?
    var options : [Option]?
    var images : [Image]?
    var image : Image?
}

struct Variant : Codable {
    var price : String?
    var sku : String?
    var inventory_quantity : Int
}

struct Option : Codable {
    var name : String
    var position : Int
}

struct Image : Codable {
    var src : String
}

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}


