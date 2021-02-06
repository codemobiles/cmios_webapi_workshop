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
        self.testLink1()
        // Do any additional setup after loading the view.
    }
    
    /*
     AF.request("https://google.com").responseString { (response) in
         switch response.result{
         case .success(let result):
             print(result)
             break
         case .failure(let error):
             print(error)
             break
         }
     }
     */
    
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

