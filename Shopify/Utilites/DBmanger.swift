//
//  DBmanger.swift
//  Shopify
//
//  Created by Macintosh on 05/07/2022.
//

import Foundation
import CoreData




protocol DeletionDelegate{
    func deleteMovieAtIndexPath(indexPath: IndexPath)
}


class DBmanger {
    
    static let sharedInstance = DBmanger()
    private init(){}
    
}


extension DBmanger {
    
    
    func addCartItem(appDelegate : AppDelegate , CartItem : CartItem) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CartItem", in: managedContext)
        
        let cartItem = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        cartItem.setValue(CartItem.productId, forKey: "productId")
        cartItem.setValue(CartItem.productImg, forKey: "productImg")
        cartItem.setValue(CartItem.productTitle, forKey: "productTitle")
        cartItem.setValue(CartItem.productType, forKey: "productType")
        cartItem.setValue(CartItem.price, forKey: "price")
        
        do {
            try managedContext.save()
            print("data Saved in cart")
        }
        catch{
            print("error in saving item in cart ")
            print(error.localizedDescription)
        }
    }
    
    func addCartItem(appDelegate : AppDelegate , productId : Int32 , productImg : String , productTitle : String , productType : String , productPrice : Double ) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CartItem", in: managedContext)
        
        let cartItem = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        cartItem.setValue(productId, forKey: "productId")
        cartItem.setValue(productImg, forKey: "productImg")
        cartItem.setValue(productTitle, forKey: "productTitle")
        cartItem.setValue(productType, forKey: "productType")
        cartItem.setValue(productPrice, forKey: "price")
        
        do {
            try managedContext.save()
            print("data Saved in cart")
        }
        catch{
            print("error in saving item in cart ")
            print(error.localizedDescription)
        }
    }
    
    
    
    func delete(cartItem :CartItem , indexPath: IndexPath, appDelegate: AppDelegate, delegate: DeletionDelegate){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(cartItem)
        do{
            try managedContext.save()
            delegate.deleteMovieAtIndexPath(indexPath: indexPath)
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
    
    
    func delete(leagueItem :CartItem , appDelegate: AppDelegate){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(leagueItem)
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
    
    
    func fetchDataCart(appDelegate : AppDelegate) -> [CartItem] {
        
        var fetchedList : [CartItem] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CartItem")

        do {
            fetchedList = try managedContext.fetch(fetchRequest) as! [CartItem]
            print("data fetched in Cart")
            
            
        } catch let error as NSError {
            print("error in fetch data From Cart")
            print(error.localizedDescription)
        }

        return fetchedList
    }
    
    
    
    
}
