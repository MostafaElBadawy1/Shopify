//
//  ProductViewController.swift
//  Shopify
//
//  Created by Ahmed on 05/07/2022.
//

import UIKit

class ProductViewController: UIViewController {
    // MARK: - Propreties
    var customerid : Int64?
    var productID:Int?
    var prandTitle:String?
    var filteredProductsArray:[Product] = []
    var arrayOfProduct:[Product] = []
    // MARK: - IBOutlets
    @IBOutlet weak var productCollectionV: UICollectionView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        productCollectionV.dataSource = self
        productCollectionV.delegate = self
        fetchProduct()
    }
    // MARK: - Fetching Function
    func fetchProduct() {
        let productViewModel1 = ProductViewModel()
        productViewModel1.fetchProduct(endPoint: "products.json?")
        productViewModel1.bindingData = {product,error in
            if let products = product{
                self.arrayOfProduct = products
                for index in 0..<self.arrayOfProduct.count{
                    if self.prandTitle == self.arrayOfProduct[index].vendor{
                        self.filteredProductsArray.append(self.arrayOfProduct[index])}}
                print(self.arrayOfProduct)
                DispatchQueue.main.async {
                    self.productCollectionV.reloadData()
                }
            }
        }
    }
}
// MARK: - CollectionViewDelegateAndDataSource
extension ProductViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredProductsArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath)as! ProductCVCell
        cell.productName.text = filteredProductsArray[indexPath.row].title
        cell.productImg.downloaded(from: filteredProductsArray[indexPath.row].image!.src)
        cell.productImg.layer.borderWidth = 2
        cell.productImg.layer.borderColor =  CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let passedData = filteredProductsArray[indexPath.row]
        let vc = UIStoryboard(name: "ProductDetails", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        vc.passedDataToProductDetailsVC2 = passedData
        vc.customerid = customerid
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
