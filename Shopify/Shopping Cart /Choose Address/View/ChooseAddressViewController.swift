//
//  ChooseAddressViewController.swift
//  Shopify
//
//  Created by Macintosh on 05/07/2022.
//

import UIKit

class ChooseAddressViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var addressChoosedlbl: UILabel!
    
    var customerID:Int!
    var cart = [CartItem]()
    
    var selectedIndex : IndexPath = []
    
    var addresses = [Address]()
    var addressChoosed : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewModel = HomeViewModelAddress( customerid: customerID)
        homeViewModel.fetchData()
        homeViewModel.bindingData = {branchs , error in
            
            if let branchs = branchs {
                self.addresses = branchs
                DispatchQueue.main.async { [self] in
                    print("addresses")
                    print(addresses)
                    self.myTableView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
            
        }

        

        myTableView.register(UINib(nibName: "ChooseAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "chooseaddress")
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func continueTopayment(_ sender: Any) {
        
        
        
        
        
        
        
    }
    

}

extension ChooseAddressViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addressChoosed = addresses[indexPath.row].address1!
        addressChoosedlbl.text = addressChoosed
        print(addressChoosed)

        tableView.deselectRow(at: indexPath, animated: true)
        /*
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        */

        for row in 0..<tableView.numberOfRows(inSection: indexPath.section) {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: indexPath.section)) {
                cell.accessoryType = row == indexPath.row ? .checkmark : .none
            }
        }
    }
    
}





extension ChooseAddressViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chooseaddress", for: indexPath) as! ChooseAddressTableViewCell
        
        
        cell.address.text = addresses[indexPath.row].address1
        cell.citylbl.text = addresses[indexPath.row].city
        
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
 
    
    
}
