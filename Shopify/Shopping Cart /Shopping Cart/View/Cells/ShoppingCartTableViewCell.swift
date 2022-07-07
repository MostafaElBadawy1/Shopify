//
//  ShoppingCartTableViewCell.swift
//  Shopify
//
//  Created by Macintosh on 04/07/2022.
//

import UIKit



protocol CartSelection {
    
    func addProductTonewCart(product : CartItem, atIndex : Int)
}


class ShoppingCartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var brandImage: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var brandCost: UILabel!
    @IBOutlet weak var numberOfBrand: UILabel!
    
    // cart
    var product:CartItem!
    // new cart
    var product2 : CartItem!
    
    
    

     
    private var counterValue : Int = 1
    var countOfArray = 0
    var productIndex = 0
    var cartSelectionDelegate: CartSelection?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        print("_________________________________________")
        print("product in cart : \((product?.price) ?? 0.0 )")
        print("product in newcart : \((product2?.price) ?? 0.0)")
        print("_________________________________________")

        
    }
    
    
   
    
    
    @IBAction func decreaseOfBrand(_ sender: Any) {
        
 
        
        
        if(counterValue != 1){
                   counterValue -= 1;
            self.numberOfBrand.text = "\(counterValue)"
            self.brandCost.text = String(product.price * Double(counterValue))
            cartSelectionDelegate?.addProductTonewCart(product: product, atIndex: productIndex)

               }
    
    }
    
    @IBAction func increaseOfBrand(_ sender: Any) {
  
        if (counterValue >= 6) {
            print("error")
        }else {
                counterValue += 1;
               self.numberOfBrand.text = "\(counterValue)"
        self.brandCost.text = String( product.price * Double(counterValue))
      
               cartSelectionDelegate?.addProductTonewCart(product: product, atIndex: productIndex)
        }
    }

    
    }
    

    


