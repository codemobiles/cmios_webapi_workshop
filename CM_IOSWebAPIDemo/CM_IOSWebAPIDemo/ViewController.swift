//
//  ViewController.swift
//  CM_IOSWebAPIDemo
//
//  Created by chaiyasit on 2/5/21.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.testLink1()
//        self.testLink2()
//        self.testLink3()
//        self.testLink4()
//        self.testLink5()
//        self.testLink6()
        // Do any additional setup after loading the view.
    }
    
  
    
    func testLink1()  {
        AF.request("https://google.com").responseString { (response) in
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
    
    
    
    
    func testLink5()  {
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
}

struct Product: Codable {
    let body, title: String?
    let id, userID: Int?

    enum CodingKeys: String, CodingKey {
        case body, title
        case userID = "userId"
        case id
    }
}
