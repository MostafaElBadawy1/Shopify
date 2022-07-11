//
//  testViewController.swift
//  Shopify
//
//  Created by Macintosh on 05/07/2022.
//

import UIKit

class testViewController: UIViewController {

    
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToCart(_ sender: Any) {
        
        db.addCartItem(appDelegate: appDelegate, productId: 123545, productImg: "", productTitle: "product1", productType: "adidus", productPrice: 100 , numofitem: 1)
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
