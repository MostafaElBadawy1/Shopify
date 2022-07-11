//
//  ProductDetailsViewController.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 04/07/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var productImagesCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var discriptionLbl: UILabel!

    @IBAction func addToCartBtn(_ sender: UIButton) {
    }
    @IBAction func addToFavoriteBtn(_ sender: UIButton) {
    }
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
