//
//  FinishOrderViewController.swift
//  Shopify
//
//  Created by Macintosh on 05/07/2022.
//

import UIKit

class FinishOrderViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var subTotalLbl: UILabel!
    @IBOutlet weak var shippingFeeslbl: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var DiscountTxtView: UITextField!
    
    
    var TotalCart  = [CartItem]()
    var totalCost : Double = 0.0
    var customerID : Int = 0
    var address : String = ""
    
    
    var discounts : [PriceRule]?
    var coupounsTxt : String = ""
    var shipping : Double = 50.0
    var total : Double = 0.0
    var discount : Double = 0.0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("totalCost \(totalCost)")
        print("customer id \(customerID)")
        print("address \(address)")
        for item in TotalCart {
            print(item)
        }
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Func Fetch DAta OF Discount
    func fetchDataOfDiscountFromViewModel(){
        let homeViewModel = HomeViewModelFinishOrder(coupountxt: "price_rules.json")
        homeViewModel.fetchData()
        homeViewModel.bindingData = {branchs , error in
    
            if let branchs = branchs {
                self.discounts = branchs
                DispatchQueue.main.async { [self] in
                    print("discounts")
                    print(discounts!)
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    
    // MARK: - Func will appear

    override func viewWillAppear(_ animated: Bool) {
        
        discountLbl.text = "\( discount)"
        subTotalLbl.text = "\(totalCost)"
        shippingFeeslbl.text = "\(shipping)"
        calculateTotal()
        
        
        
    }
    
    // MARK: - btn make order

    
    @IBAction func makeorder(_ sender: Any) {
    }
    
    
    
    
    // MARK: - btn Validate

    @IBAction func validateCoupon(_ sender: Any) {
        
        // fetch coupon
        
        coupounsTxt = DiscountTxtView.text!
        fetchDataOfDiscountFromViewModel()
        
        if (coupounsTxt == "SUMMERSALE10OFF") {
            discount = -10.0
            discountLbl.text = "\(-1 * discount)"
        }else {
            discount = 0.0
            discountLbl.text = "\(-1 * discount)"
        }
        calculateTotal()
    }
    
    

    
    
    func makeDesignToView () {
        // corner radius
        myView.layer.cornerRadius = 20

        // border
        myView.layer.borderWidth = 2.0
        myView.layer.borderColor = UIColor.black.cgColor
    }

    // MARK: - Func Calculate total

    func calculateTotal () {
        total = totalCost + shipping + discount
        totalLbl.text = "\(total)"
        
    }
    
}






