//
//  CartView.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 10/04/23.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager : CartManager
    
    var body: some View {
//        Text("Number of items: \(cartManager.products.count)")
        ScrollView{
            if(cartManager.paymentSuccess){
                Text("Thank you for your purchase")
                    .padding()
            }
             else{
                 if(cartManager.products.count > 0 && !cartManager.myWines.isEmpty){
                     // refactored product's list
//                     ForEach(cartManager.products, id: \.id){ product in
//                         WineRow(product: product)
//                     }
                     ForEach(cartManager.myWines.sorted(by: >), id: \.key){ key, value in
                         let myProduct = cartManager.products.first(where: {$0.name == key})
                         // come backs optional, so it needs to be unwrapped :(
                         if let myWine = myProduct{
                             WineRow(product: myWine)
                         }
                     }
                     HStack{
                         Text("Your cart total is: ")
                         Spacer()
                         Text("$\(cartManager.total).00")
                             .bold()
                     }
                     .padding()
                     PaymentButton(action: cartManager.pay)
                     
                 } else{
                     Text("Your cart is empty :(")
                 }
            }
            
        } //scrllV
        .navigationTitle("My Cart")
        .navigationBarTitleDisplayMode(.large)
        .padding(.top)
        .onDisappear{
            if(cartManager.paymentSuccess){
                cartManager.paymentSuccess = false
            }
        }
    }
}
