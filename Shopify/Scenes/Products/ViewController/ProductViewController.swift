//
//  ProductViewController.swift
//  Shopify
//
//  Created by Ahmed on 05/07/2022.
//

import UIKit

class ProductViewController: UIViewController {
    var productID:Int?
    var arrayOfProduct:[Product] = []
    @IBOutlet weak var productCollectionV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        //productCollectionV.dataSource = self
        //productCollectionV.delegate = self
        let productViewModel1 = ProductViewModel()
        productViewModel1.fetchProduct(endPoint: "products.json?collection_id=\(productID)")
      
        productViewModel1.bindingData = {product,error in
            if let products = product{
                self.arrayOfProduct = products
          //      print("tmaam")
                print(self.arrayOfProduct)
               // print("\(productViewModel1.fetchData(endPoint: "\(self.productID)"))")
                DispatchQueue.main.async {
                    self.productCollectionV.reloadData()
                    
            }
                  }
            
            
            
            
            
            
            
        }
        
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
extension ProductViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath)as! ProductCVCell
        cell.productName.text = arrayOfProduct[indexPath.row].title
        return cell
    }
    
    
    
}
