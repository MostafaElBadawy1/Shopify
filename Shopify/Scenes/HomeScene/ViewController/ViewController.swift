//
//  ViewController.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 04/07/2022.
//

import UIKit
//import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var brandsSearchBar: UISearchBar!
    @IBOutlet weak var brandCollectionView: UICollectionView!
    var brandArr:[SmartCollection] = []
    @IBOutlet weak var annnceImg: UIImageView!
    let images = [UIImage(named: "vv"), UIImage(named: "aa"), UIImage(named: "bb")].compactMap{$0} sett1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello world")
        print("Hello world")
        print("ahmed")
        print("mahmoud")
        print("khalifa")
        print("SHIHA")
        annnceImg.animationImages = images
        annnceImg.animationDuration = 4
        annnceImg.startAnimating()
        brandCollectionView.dataSource = self
        brandCollectionView.delegate = self
        //fetchData
=======
    func fetchData(){
 develop
        let homeViewModel = HomeViewModel()
        homeViewModel.fetchData()
        homeViewModel.bindingData = {brands , error in
            
            if let brands = brands {
                self.brandArr = brands
                DispatchQueue.main.async {
                    self.brandCollectionView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        annnceImg.animationImages = images
        annnceImg.animationDuration = 4
        annnceImg.startAnimating()
        brandCollectionView.dataSource = self
        brandCollectionView.delegate = self
        //fetchData
        
        
        // Do any additional setup after loading the view.
    }


}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandArr.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let productVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController {

            productVC.productID = brandArr[indexPath.row].id
            self.present(productVC, animated: true, completion: nil)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCell", for: indexPath) as! BrandCollectionViewCell
        
        
    //    cell.brandImg.sd_setImage(with: URL(string:brandArr[indexPath.row].image.src ?? ""), placeholderImage: UIImage(named: "R2.png"))
        cell.brandName.text = brandArr[indexPath.row].title
        return cell
    }
    
    
    
}
