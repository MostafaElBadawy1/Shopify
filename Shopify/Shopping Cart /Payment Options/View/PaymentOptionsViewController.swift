//
//  PaymentOptionsViewController.swift
//  Shopify
//
//  Created by Macintosh on 05/07/2022.
//

import UIKit

class PaymentOptionsViewController: UIViewController {
    
    
    @IBOutlet weak var countinueLBLbtn: UIButton!
    let options : [String] = ["Pay Online" , "Cash On Delivery (COD)"]
    
    var TotalCart  = [CartItem]()
    var totalCost : Double = 0.0
    var customerID : Int = 0
    var address : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(address)
        print(customerID)
        print(totalCost)
        for item in TotalCart {
            print(item)
        }

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Continue to Paymnet
    
    @IBAction func ContinueToFinishOrder(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "finsihOrder") as! FinishOrderViewController
        vc.totalCost = totalCost
        vc.customerID = customerID
        vc.address = address
        for item in TotalCart {
            vc.TotalCart.append(item)
            
        }
        present(vc, animated: true, completion: nil)

    }
    
   


}


// MARK: - table View Delegate

extension PaymentOptionsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        for row in 0..<tableView.numberOfRows(inSection: indexPath.section) {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: indexPath.section)) {
                cell.accessoryType = row == indexPath.row ? .checkmark : .none
            }
        }
        // payonline
        if (indexPath.row == 0 ){
            
            
        }
        else
        {
            // MARK: - show alert when cost > ..

            if totalCost >= 1000 {
                            let alert = UIAlertController(title: "Error", message: "You Must Pay online ", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                
                countinueLBLbtn.isHidden = true
                
            }

        }
    }
}





// MARK: - table View Data Source
extension PaymentOptionsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentoptions", for: indexPath) as! PaymentOptionsTableViewCell
        cell.paymentOptionslbl.text = options[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
