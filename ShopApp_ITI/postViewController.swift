//
//  postViewController.swift
//  ShopApp_ITI
//
//  Created by Zeinab on 28/02/2023.
//

import UIKit
import Alamofire

class postViewController: UIViewController {
    
    override func viewDidLoad() {super.viewDidLoad()}
    @IBAction func post(_ sender: Any) {
        //let parameters: [String : Any] = ["customer" : ["id":111111111111,"email":"zeinab@gmail.com"]]
        //let url = "https://29f36923749f191f42aa83c96e5786c5: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@ios-q2-new-capital-admin-2022-2023.myshopify.com/admin/api/2023-01/customers.json"
        
        //https://29f36923749f191f42aa83c96e5786c5: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@ios-q2-new-capital-admin-2022-2023.myshopify.com/admin/api/2023-01/products.json
        
        //https://29f36923749f191f42aa83c96e5786c5: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@ios-q2-new-capital-admin-2022-2023.myshopify.com/admin/api/2023-01/price_rules/1380100899094/discount_codes.json
        
               //let parameters: [String : Any] = ["product" : ["title":"Shooess","body_html":"this is comfotable shoes","vendor":"ZZZ"]]
       // let parameters: [String : Any] = ["product" : ["title":"Adidas B 3S T GN3995","body_html":"Adidas B 3S T GN3995 NOT SPORTS SPECIFIC black T-SHIRT (SHORT SLEEVE) for JUNIOR","vendor":"ADIDAS","status":"active","variants":["price":"293:0","sku":"AD-50=black-s","inventory_quantity":15],"options":[],"images":[]]]
        let product : Products = Products(id: 55, title: "BackBag", vendor: "ADIDAS", product_type: "ACCESSORIES", status: "inactive",variants: [Variant(sku: "mmmmmm-12", inventory_quantity: 5)],image: Image(src: "https://cdn.shopify.com/s/files/1/0427/7095/6453/products/1_6_1024x1024.jpg?v=1603993980"))
        let parameters : ProductsResult = ProductsResult(products: [product])
        print(try? parameters.asDictionary())
      //  let parameters: [String : Any] = ["discount_code" : ["code":"Zeinab2000","usage_count":0]]
        
//        var parameters : Products?
//        parameters?.title = "BackBag"
//        parameters?.body_html = "good bag"
//        parameters?.vendor = "ADIDAS"
//        parameters?.status = "inactive"
//        parameters?.variants?[0].price = "220.0"
//        parameters?.variants?[0].sku = "AD-50-BLACK-19"
//        parameters?.variants?[0].inventory_quantity = 3
//        parameters?.image?.src = "https://cdn.shopify.com/s/files/1/0427/7095/6453/products/1_6_1024x1024.jpg?v=1603993980"
     //   postMethod(url: "https://29f36923749f191f42aa83c96e5786c5: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@ios-q2-new-capital-admin-2022-2023.myshopify.com/admin/api/2023-01/products.json", parameters: try! parameters.asDictionary())
//
//        deleteMethod(url: "https://29f36923749f191f42aa83c96e5786c5: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@ios-q2-new-capital-admin-2022-2023.myshopify.com/admin/api/2023-01/products.json", parameters: parameters)
        postData(url: "https://29f36923749f191f42aa83c96e5786c5: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@ios-q2-new-capital-admin-2022-2023.myshopify.com/admin/api/2023-01/products.json", parameters: product)
    }
    
    
    /*//                let parameters: [String : Any] = [
     //                    "id": 1234,
     //                    "title":"shoes",
     //                    "body_html":"shoes",
     //                    "vendor":"Adidas",
     //                    "variants": ["price":"50"]
     //                ]*/
    
    func postMethod(url : String , parameters : [String:Any]) {
        
        
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let session = URLSession.shared
        request.httpShouldHandleCookies = false
        
        
        
        print(parameters)
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data , options: .allowFragments)
                
                print("SUCEES:\(response)")
            }
            catch {
                print(error)
            }
            
        }.resume()
        
        
    }
    
     func postData(url: String, parameters: Products)
        {
            var headers = HTTPHeaders()
            headers.add(name: "Content-Type", value: "application/json")
            headers.add(name: "Accept", value: "application/json")
            
            AF.request(url, method: .post, parameters:parameters, encoder: JSONEncoder.self as! ParameterEncoder, headers:headers).response { response in
                switch response.result{
                        
                    case .success(_):
                        print("Success \(response)")
                    case .failure(_):
                        print("Failure \(response)")
                }
            }
        }
    
    func deleteMethod(url : String , parameters : [String : Any]){
        
        
        
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        let session = URLSession.shared
        request.httpShouldHandleCookies = false
        
        
        
        print(parameters)
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data , options: .allowFragments)
                
                print("SUCEES:\(response)")
            }
            catch {
                print(error)
            }
            
        }.resume()
        
        
        
    }
}




/*func post (){
 guard let url = URL(string: "https://29f36923749f191f42aa83c96e5786c5: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@ios-q2-new-capital-admin-2022-2023.myshopify.com/admin/api/2023-01/customers.json") else {return}
 var request = URLRequest(url: url)
 request.httpMethod = "POST"

 let seecsion = URLSession.shared
 
 
 request.httpShouldHandleCookies = false
 let body: Customers = Customers(customers:customer(first_name: "Zeinab", last_name: "mohamed", email: "zm@gmail.com",phone: "010655555",tags: "" ,id: 12345, verified_email: true,addresses: [Address()], note: "") )
//  let body = customer(id: 1234 , email: "zm@gmail.com")
 //let body: discounts = discounts(id: 12354585444,price_rule_id: 5474454545,code: "VVV8MOUY",usage_count: 0,created_at: "2023-03-3T04:02:02-05:00" , updated_at: "2023-03-3T04:02:02-05:00")

 request.httpBody = try? JSONSerialization.data(withJSONObject: body.asDictionary() , options: .prettyPrinted)
 
 request.addValue("application/json", forHTTPHeaderField: "Content-Type")
 request.addValue("application/json", forHTTPHeaderField: "Accept")

 

 let task = URLSession.shared.dataTask(with: request) {data, _, error in
     guard let data = data, error == nil else {
         return
     }

     do {
         let response = try JSONSerialization.jsonObject(with: data , options: .allowFragments)
         
         print("SUCEES:\(response)")
     }
     catch {
         print(error)
     }
 }
 task.resume()

}



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
struct Customers : Codable {
var customers : customer
}
struct customer : Codable {
let first_name, last_name, email, phone, tags: String?
let id: Int?
let verified_email: Bool?
let addresses: [Address]?
let note: String?

}

struct Address: Codable {
var address1, address2, city: String?
var country: String?
var id: Int?
var phone: String?

}

struct discounts : Codable {
var id : Int?
var price_rule_id : Int?
var code : String?
var usage_count : Int?
var created_at : String?
var updated_at : String?
}


/*        AF.request("https://29f36923749f191f42aa83c96e5786c5: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@ios-q2-new-capital-admin-2022-2023.myshopify.com/admin/api/2023-01/customers.json", method: .post, parameters: (params as! Dictionary), encoding: JSONEncoding.default).responseData { response in
switch response.result {
case .success(let data):
  do {
      guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
          print("Error: Cannot convert data to JSON object")
          return
      }
      guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
          print("Error: Cannot convert JSON object to Pretty JSON data")
          return
      }
      guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
          print("Error: Could print JSON in String")
          return
      }

      print(prettyPrintedJson)
  } catch {
      print("Error: Trying to convert JSON data to string")
      return
  }
case .failure(let error):
  print(error)
}
}*/
*/
    
    
    
    
    
