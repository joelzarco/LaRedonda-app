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
    
    
    func addToCart(product : Product){
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product : Product){
        products = products.filter{ $0.id != product.id }
        total -= product.price
    }
}
