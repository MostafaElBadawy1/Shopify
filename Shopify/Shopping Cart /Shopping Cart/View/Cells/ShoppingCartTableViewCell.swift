//
//  ShoppingCartTableViewCell.swift
//  Shopify
//
//  Created by Macintosh on 04/07/2022.
//

import UIKit



class ShoppingCartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var increaseOut: UIButton!
    @IBOutlet weak var decreaseOut: UIButton!
    
    @IBOutlet weak var brandImage: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var brandCost: UILabel!
    @IBOutlet weak var numberOfBrand: UILabel!
    
    // cart
    var product:CartItem?
    private var counterValue : Int = 1


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state


    }
    
    
   
    
    
    @IBAction func decreaseOfBrand(_ sender: UIButton) {
        
        if(counterValue != 1){
                   counterValue -= 1;
            self.numberOfBrand.text = "\(counterValue)"
               }
             
    
    }
    
    @IBAction func increaseOfBrand(_ sender: UIButton) {
 
                counterValue += 1;
               self.numberOfBrand.text = "\(counterValue)"
        
    }

    
    }
    

    


