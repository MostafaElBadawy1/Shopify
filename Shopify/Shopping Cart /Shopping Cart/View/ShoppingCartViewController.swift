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
    
    var total = [Double]()
    
    var totalprize : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculateTotal()
        
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
            calculateTotal()
        }
        totalCost.text = "\(totalprize)"

    }

    // MARK: - func processed to check out

    @IBAction func ProcessedToCheckOut(_ sender: Any) {
        
        if (customerID != nil) {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "chooseaddress") as! ChooseAddressViewController
            vc.customerID = customerID
            for item in newCart {
                vc.cart.append(item)
                
            }
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
            
            
        }else {
            // go to sign up to add user
            
        }
        
      
        
    }
    
}


// MARK: - table view delegate

extension ShoppingCartViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [self] Action, view, completionHandler in
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
     
        cell.brandName.text = newCart[indexPath.row].productTitle
         cell.product = cart[indexPath.row]
        cell.product2 = newCart[indexPath.row]
            cell.brandCost.text = "\(cell.product.price)"
         cell.productIndex = indexPath.row
         cell.cartSelectionDelegate = self
      //  cell.brandCost.text = "\(newCart[indexPath.row].price)"
        
        cell.countOfArray = newCart.count
         
        return cell
        
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
            self.myTableView.reloadData()

        }
    }

    
    
    // MARK: - Func to calculate total and print

     func calculateTotal()
         {
             var totalValue = 0.0
             for objProduct in newCart {
                 totalValue += objProduct.price
             }
             self.totalCost.text = "\(totalValue) $"

}


}


// MARK: - Func Add product to new cart


extension ShoppingCartViewController : CartSelection {

func addProductTonewCart(product: CartItem, atIndex: Int) {
    //newCart[atIndex] = product
    newCart.append(product)
//        newCart[atIndex] = product
    print("___________ new array _______")
    print(newCart)
            calculateTotal()
}
}
