//
//  ViewController.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 04/07/2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var brandCollectionView: UICollectionView!
    let images = [UIImage(named: "vv"), UIImage(named: "aa"), UIImage(named: "bb")].compactMap{$0}
    var brandArr:[SmartCollection] = []
    var filteredArray: [SmartCollection] = []
    @IBOutlet weak var annnceImg: UIImageView!
    @IBOutlet weak var brandsSearchBar: UISearchBar!
    
    @IBAction func cartButton(_ sender: UIBarButtonItem) {
        let check =   Helper.shared.getUserStatus()
        if check == true{
            let vc = storyboard?.instantiateViewController(withIdentifier: "CartsViewController") as? CartsViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else{
            let vc = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func favoritButton(_ sender: Any) {
        let check =   Helper.shared.getUserStatus()
        if check == true{
            // navegate to favorite VC
        }
        else{
            let vc = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configreView ()
        configCvAndSearch()
        fetchDataToHome()
      
        
    }
    func configreView () {
        annnceImg.animationImages = images
        annnceImg.animationDuration = 4
        annnceImg.startAnimating()
        
    }
    func configCvAndSearch() {
        brandCollectionView.dataSource = self
        brandCollectionView.delegate = self
        brandsSearchBar.delegate = self
    }
    func fetchDataToHome() {
        let homeViewModel = HomeViewModel()
        homeViewModel.fetchData()
        homeViewModel.bindingData = {brands , error in
            
            if let brands = brands {
                self.brandArr = brands
                self.filteredArray = self.brandArr
                DispatchQueue.main.async {
                    self.brandCollectionView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCell", for: indexPath) as! BrandCollectionViewCell
        
        
        cell.brandImg.sd_setImage(with: URL(string:filteredArray[indexPath.row].image.src ), placeholderImage: UIImage(named: "R2.png"))
        cell.brandName.text = filteredArray[indexPath.row].title
        return cell
    }
}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText == "" {
            filteredArray = brandArr
            self.brandCollectionView.reloadData()
        } else {
        filteredArray = brandArr.filter({ mod in
            return mod.title!.contains(searchText.uppercased())
        })
        self.brandCollectionView.reloadData()
        }
    }
    }

