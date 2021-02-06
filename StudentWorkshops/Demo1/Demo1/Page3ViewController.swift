//
//  Page3ViewController.swift
//  Demo1
//
//  Created by chaiyasit on 2/6/21.
//

import UIKit
import Alamofire
class Page3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.uploadFile(url: targetURL, data: <#T##Data#>, fileName: <#T##String#>)
        // Do any additional setup after loading the view.
    }
    
    
    func uploadFile(url: String, data: Data, fileName: String) {
        let parameter = ["username": "ABCD", "password": "12345678"]
        
        AF.upload(multipartFormData: { MultipartFormData in
            MultipartFormData.append(data, withName: "image", fileName: fileName, mimeType: "image/jpg")
            for(key,value) in parameter{
                MultipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
        }, to: url, method: .post).uploadProgress(queue: .main, closure: { progress in
            //Current upload progress of file
            //print("Upload Progress: \(progress.fractionCompleted)")
        }).responseString(completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                print(value)
                break
            case .failure:
                print("failure")
                break
            }
        })
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
