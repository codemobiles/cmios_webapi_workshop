//
//  Page1ViewController.swift
//  Demo1
//
//  Created by chaiyasit on 2/6/21.
//

import UIKit
import Alamofire
class Page1ViewController: UITableViewController {
    var dataArray:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    func loadData()  {
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


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
