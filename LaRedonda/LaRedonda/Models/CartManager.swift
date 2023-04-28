//
//  CartManager.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 10/04/23.
//

import Foundation

class CartManager : ObservableObject{
    
    @Published var products : [Product] = []
    @Published var total : Int = 0
    // fixing cart view quantities, avoid duplicates on array
    @Published var quantity : Int = 0
    @Published var myProducts = [String : Int]() // [wine : quantity]
    
    // Payment stuff
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess : Bool = false
    
    
    func addToCart(product : Product){
        products.append(product)
        total += product.price
        // check if wine is already on cart, if true add 1, else add new element with quantity = 1
        if(myProducts.contains{ $0.key == product.name}){
            quantity = myProducts[product.name]!
            quantity += 1
            myProducts.updateValue(quantity, forKey: product.name)
        } else{
            myProducts.updateValue(1, forKey: product.name)
        }
    }
    
    func removeFromCart(product : Product){
//        products = products.filter{ $0.id != product.id }
        if let removedProduct = products.firstIndex(where: {$0.id == product.id}){ // this way it only removes one instance of given wine
            products.remove(at: removedProduct)
        }
        total -= product.price
        // New sugestion for handling wine removal from cart
        if let quantity = myProducts[product.name]{
            if (quantity > 1){
                let q = quantity - 1
                myProducts.updateValue(q, forKey: product.name)
            }else{
                myProducts.removeValue(forKey: product.name)
            }
        }
    }
    
    func pay(){
        paymentHandler.startPayment(products: products, total: total) { success in
            self.paymentSuccess = success
            self.products = [] // reset cart. Maybe it would a good idea to add a section with previous orders
            self.total = 0
        }
    }
}
