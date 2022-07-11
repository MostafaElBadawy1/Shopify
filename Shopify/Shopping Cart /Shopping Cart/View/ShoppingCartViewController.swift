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
    
    
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate


    var customerID : Int? = 6261211300054
    
    var cart = [CartItem]()
    var newCart = [CartItem]()
    

    var productCosts = [Double]()
    var counters = [Int]()
    
 merge
    
    var totalprize : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        calculateTotal()

 merge
        myTableView.reloadData()
        

        
        myTableView.register(UINib(nibName: "ShoppingCartTableViewCell", bundle: nil), forCellReuseIdentifier: "shoppingcart")
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - func will appear

    override func viewWillAppear(_ animated: Bool) {
        calculateTotal()
        myTableView.reloadData()
        cart = db.fetchDataCart(appDelegate: appDelegate)
        totalCost.text = "\(totalprize)"
        
        for item in cart {
            newCart.append(item)

            productCosts.append(item.price)
            counters.append(1)
 merge
            calculateTotal()
        }
        totalCost.text = "\(totalprize)"

    }

    // MARK: - func processed to check out

    @IBAction func ProcessedToCheckOut(_ sender: Any) {
        
        if (customerID != nil) {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "chooseaddress") as! ChooseAddressViewController
            vc.customerID = customerID

            vc.totalCost = totalprize
            
            if (newCart.count != 1 ){
            for i in 0...(newCart.count - 1) {
                newCart[i].numOfItem = Int16(counters[i])
            }
                
            }else {
                
                    print(newCart.count)
                    newCart[0].numOfItem = Int16(counters[0])
                
            }
            
            for item in newCart {
                vc.cart.append(item)
            }
        
            present(vc, animated: true, completion: nil)
            
 merge
        }else {
            // go to sign up to add user
            
        }
        

    
 merge
    }
    
}


// MARK: - table view delegate

extension ShoppingCartViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    /*
        let alert = UIAlertController(title: "Remove Product", message: "Are You Sure To Remove this Product ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        */
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [self] Action, view, completionHandler in
            myTableView.reloadData()
            print("_________________________")
            print(indexPath.row)
            print(productCosts[indexPath.row])
            print(counters[indexPath.row])
            productCosts.remove(at: indexPath.row)
           counters.remove(at: indexPath.row)
           // counters[indexPath.row ] = 0
           // productCosts[indexPath.row  ] = 0.0
            calculateTotal()
            db.delete(cartItem: cart[indexPath.row], indexPath: indexPath, appDelegate: appDelegate, delegate: self)
            myTableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
        }
    }


// MARK: - table view data source

extension ShoppingCartViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingcart", for: indexPath) as! ShoppingCartTableViewCell
     

        cell.brandName.text = cart[indexPath.row].productTitle
        cell.brandCost.text = "\(cart[indexPath.row].price)"
        cell.product = cart[indexPath.row]
        
        cell.decreaseOut.tag = indexPath.row
        cell.decreaseOut.addTarget(self, action: #selector(decreaseProduct(sender:)), for: .touchUpInside)
        
        cell.increaseOut.tag = indexPath.row
        cell.increaseOut.addTarget(self, action: #selector(increaseProduc(sender:)), for: .touchUpInside)
        
 merge
         
        return cell
        
    }
    
    @objc func decreaseProduct( sender: UIButton){
        if counters[sender.tag] != 1 {
            counters[sender.tag] -= 1
          
        }
        print("decrease indexpath : \(sender.tag)")
        productCosts[sender.tag] = cart[sender.tag].price * Double(counters[sender.tag])
        print(productCosts[sender.tag])

        calculateTotal()
    
    
    }
    
    @objc func increaseProduc(sender : UIButton) {
        counters[sender.tag] += 1
        print("increase indexpath \(sender.tag)")
        print("counter \(counters[sender.tag])")
        print(productCosts[sender.tag])
        productCosts[sender.tag] = cart[sender.tag].price * Double(counters[sender.tag])
        print(productCosts[sender.tag])
       
        calculateTotal()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

}




extension ShoppingCartViewController : DeletionDelegate {
    
    
    // MARK: - Func to delete product from cart

    func deleteMovieAtIndexPath(indexPath: IndexPath) {

        cart.remove(at: indexPath.row)
        DispatchQueue.main.async {
            self.calculateTotal()
            self.myTableView.reloadData()

        }
    }

    
    
    // MARK: - Func to calculate total and print

     func calculateTotal()
         {
             var totalValue = 0.0

             
             for i in productCosts {
                 totalValue += i
                 print("totalValue\(totalValue)")
 merge
             }
            
             totalprize = totalValue
             self.totalCost.text = "\(totalprize) $"

}



 merge
}



