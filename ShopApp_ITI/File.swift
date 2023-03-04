//
//  File.swift
//  ShopApp_ITI
//
//  Created by Zeinab on 27/02/2023.
//

import Foundation
import Alamofire

protocol Services {
    
    static func fetch <T : Decodable>(url:String?,compiletionHandler : @escaping (T?)->Void)
}

class NetworkService : Services{

    static func fetch <T : Decodable>(url:String?,compiletionHandler : @escaping (T?)->Void){
        
        let request = AF.request(url ?? "")
        
        request.responseDecodable(of:T.self) { (response) in
            guard let resultOfAPI = response.value else {

                compiletionHandler(nil)
              return }

        compiletionHandler(resultOfAPI)
        }
   }
}
