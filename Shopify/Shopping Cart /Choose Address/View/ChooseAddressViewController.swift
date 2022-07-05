//
//  ChooseAddressViewController.swift
//  Shopify
//
//  Created by Macintosh on 05/07/2022.
//

import UIKit

class ChooseAddressViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var listItemArray : [String] = Array()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.register(UINib(nibName: "ChooseAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "chooseaddress")

        
        listItemArray.append("mansoura")
        listItemArray.append("alex")
        listItemArray.append("mahalah")


    
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func continueTopayment(_ sender: Any) {
    }
    

}

extension ChooseAddressViewController : UITableViewDelegate {

    
}





extension ChooseAddressViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chooseaddress", for: indexPath) as? ChooseAddressTableViewCell
        
        cell?.address.text = listItemArray[indexPath.row]
        cell?.selectionStyle = .none
        
        cell?.circleNotFill.addTarget(self, action: #selector(checkMarkButtonClicked( sender:)), for: .touchUpInside)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    
  @objc func checkMarkButtonClicked (sender : UIButton) {
        
    }
    
    
}
