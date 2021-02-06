//
//  ViewController.swift
//  Demo1
//
//  Created by chaiyasit on 2/6/21.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {
    // Lek - CodeMobiles
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.testLink1()
//        self.testLink2()
//        self.notifyLine(message: "Hey", token:  "UCY2sei3F7H6HAgC8vRtLmvfIWS0ElL5Cd1d0ldbuxv")
//        testLink3()
//        testLink4()
//        testLink5()
//        testLink6()
//        testLink7()
        self.loginWithJSON(username: "lek", password: "555")
        self.loginWithUrlEncodedForm(username: "codemobiles_urlencoded", password: "666")
    }
    
    func loginWithJSON(username: String, password: String)  {
        let data:[String:String] = ["username":username, "password":password]
        AF.request("http://192.168.1.4:8080/login", method: .post, parameters: data, encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(GeneralResult.self, from: data)
                    print(result.result)
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
    
    func loginWithUrlEncodedForm(username: String, password: String)  {
        let data:[String:String] = ["username":username, "password":password]
        AF.request("http://192.168.1.4:8080/login", method: .post, parameters: data).responseJSON { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(GeneralResult.self, from: data)
                    print(result.result)
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
    
    
    func testLink7()  {
        AF.request("https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=foods", method: .get).responseJSON { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let youtubePlaylist =  try decoder.decode(YoutubePlaylist.self, from: data)
                    guard let youtubes = youtubePlaylist.youtubes else {
                        return
                    }
                    for item in youtubes {
                        print(item.title!)
                    }
                }catch let error {
                    print(error)
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func testLink6()  {
        AF.request("http://jsonplaceholder.typicode.com/posts", method: .get).responseJSON { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let products =  try decoder.decode([Product].self, from: data)
                    for product in products {
                        print("\(Product.CodingKeys.id.stringValue) : \(product.id!)")
                        print("\(Product.CodingKeys.userID.stringValue) : \(product.userID!)")
                        print("\(Product.CodingKeys.title.stringValue) : \(product.title!)")
                        print("\(Product.CodingKeys.body.stringValue) : \(product.body!)")
                        print("\n\n")
                    }
                }catch let error {
                    print(error)
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
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
                    print("\(Product.CodingKeys.userID.stringValue) : \(product.userID!)")
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

