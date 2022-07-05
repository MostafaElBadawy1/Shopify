//
//  ChooseAddressTableViewCell.swift
//  Shopify
//
//  Created by Macintosh on 05/07/2022.
//

import UIKit

class ChooseAddressTableViewCell: UITableViewCell {
    @IBOutlet weak var circleNotFill: UIButton!
    @IBOutlet weak var address: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func ChooseAddress(_ sender: Any) {
    }
}
