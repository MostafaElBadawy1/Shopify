//
//  ShoppingCartTableViewCell.swift
//  Shopify
//
//  Created by Macintosh on 04/07/2022.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var brandImage: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var brandCost: UILabel!
    
    @IBOutlet weak var numberOfBrand: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func decreaseOfBrand(_ sender: Any) {
    }
    @IBAction func increaseOfBrand(_ sender: Any) {
    }
    
}
