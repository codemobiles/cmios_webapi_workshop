//
//  ViewController.swift
//  Demo1
//
//  Created by chaiyasit on 2/6/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    // Lek - CodeMobiles
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.testLink1()
//        self.testLink2()
//        self.notifyLine(message: "Hey", token:  "UCY2sei3F7H6HAgC8vRtLmvfIWS0ElL5Cd1d0ldbuxv")
//        testLink3()
//        testLink4()
        testLink5()
    }
    
    func testLink5(){
        let data:[String:String] = ["title":"codemobiles", "body":"iOS", "userId": "6"]
        AF.request("http://jsonplaceholder.typicode.com/posts", method: .post, parameters: data).responseJSON { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let product =  try decoder.decode(Product.self, from: data)
                    
                    print("\(Product.CodingKeys.id.stringValue) : \(product.id!)")
//                    print("\(Product.CodingKeys.userID.stringValue) : \(product.userID!)")
                    print("\(Product.CodingKeys.title.stringValue) : \(product.title!)")
                    print("\(Product.CodingKeys.body.stringValue) : \(product.body!)")
                }catch let error{
                    print(error)
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func testLink4()  {
        let data:[String:String] = ["title":"codemobiles", "body":"iOS", "userId": "6"]
        AF.request("http://jsonplaceholder.typicode.com/posts", method: .post, parameters: data).responseString { (response) in
            switch response.result {
            case .success(let result):
                print(result)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func testLink3()  {
        AF.request("http://jsonplaceholder.typicode.com/posts", method: .get).responseString { (response) in
            switch response.result {
            case .success(let result):
                print(result)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func notifyLine(message:String, token: String){
        let data: [String: String] = ["message": message + " จาก POSPOS-iOS"]
        let headers: HTTPHeaders = ["Authorization":  "Bearer \(token)", "Accept": "application/json"]
        
        AF.request("https://notify-api.line.me/api/notify", method: .post, parameters: data, headers: headers).responseString { (response) in
            switch response.result {
            case .success(let result):
                print(result.description)
            case .failure(_): break
            }
        }
    }
    
    func testLink2()  {
          AF.request("http://jsonplaceholder.typicode.com/posts").responseString { (response) in
              switch response.result {
              case .success(let result):
                  print(result)
                  break
              case .failure(let error):
                  print(error)
                  break
              }
          }
      }
    
    func testLink1(){
        AF.request("https://google.com").responseString { (response) in
            switch response.result{
            case .success(let result):
                print(result)
                break
            case .failure(_):
                print("Something wrong...")
                break
            }
        }
    }
  
      
}

