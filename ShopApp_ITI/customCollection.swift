//
//  customCollection.swift
//  ShopApp_ITI
//
//  Created by Zeinab on 27/02/2023.
//

import Foundation

class CustomCollections : Decodable {
    var custom_collections : [Catigories]
}

class Catigories : Decodable {
    var id : Int
    var handle : String?
    var title : String
    var body_html : String?
}
