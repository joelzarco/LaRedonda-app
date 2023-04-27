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
    
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess : Bool = false
    
    
    func addToCart(product : Product){
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product : Product){
        products = products.filter{ $0.id != product.id }
        total -= product.price
    }
    
    func pay(){
        paymentHandler.startPayment(products: products, total: total) { success in
            self.paymentSuccess = success
            self.products = [] // reset cart. Maybe it would a good idea to add a secction with previous orders 
            self.total = 0
        }
    }
}
