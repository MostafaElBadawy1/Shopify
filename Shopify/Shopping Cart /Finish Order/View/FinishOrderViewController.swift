//
//  FinishOrderViewController.swift
//  Shopify
//
//  Created by Macintosh on 05/07/2022.
//

import UIKit

class FinishOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
@IBOutlet weak var myView: UIView!


override func viewDidLoad() {
    super.viewDidLoad()
  //  makeShadow()

    makeDesignToView()
    // Do any additional setup after loading the view.
}




func makeDesignToView () {
    // corner radius
    myView.layer.cornerRadius = 20

    // border
    myView.layer.borderWidth = 2.0
    myView.layer.borderColor = UIColor.black.cgColor


}


}

