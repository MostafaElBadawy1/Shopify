//
//  FavouriteViewController.swift
//  Shopify
//
//  Created by Macintosh on 16/07/2022.
//

import UIKit

class FavouriteViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var customerId : Int64?
    
    var orders = [Favourite]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        override func viewWillAppear(_ animated: Bool) {
       // print(customerId!)
            orders = db.fetchFavouriteById(appDelegate: appDelegate, customerid: customerId ?? 0)
        for o in orders {
            print(o.title)
        }
        myTableView.reloadData()
    }
}
extension FavouriteViewController : UITableViewDelegate {
    // delete
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.reloadData()
        db.deleteProductInFavourite(product: orders[indexPath.row], appDelegate: appDelegate)
        orders.remove(at: indexPath.row)
        myTableView.reloadData()

    }
}

extension FavouriteViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favourite", for: indexPath) as! FvTableViewCell
        cell.imageOfProduct.downloaded(from: orders[indexPath.row].image ?? "")
        cell.PriceOfProduct.text = "\(orders[indexPath.row].price)"
        cell.titleOfProduct.text = "\(orders[indexPath.row].title)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    
}


