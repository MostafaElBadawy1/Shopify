//
//  ShoppingCartViewController.swift
//  Shopify
//
//  Created by Macintosh on 04/07/2022.
//

import UIKit

class ShoppingCartViewController: UIViewController {

  
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myTableView.register(UINib(nibName: "ShoppingCartTableViewCell", bundle: nil), forCellReuseIdentifier: "shoppingcart")
        
        // Do any additional setup after loading the view.
    }



    @IBAction func ProcessedToCheckOut(_ sender: Any) {
    }
    
}



extension ShoppingCartViewController : UITableViewDelegate {}


extension ShoppingCartViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingcart", for: indexPath) as? ShoppingCartTableViewCell
        
        cell?.brandName.text = "ahmed brand name and yellow"
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    
}
