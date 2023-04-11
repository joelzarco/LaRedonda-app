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
        Text("Number of items: \(cartManager.products.count)")
        ScrollView{
            if(cartManager.products.count > 0){
                ForEach(cartManager.products, id: \.id){ product in
                    WineRow(product: product)
                }
                HStack{
                    Text("Your cart total is: ")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
//
            } else{
                Text("Your cart is empty")
            }

        } //scrllV
        .navigationTitle("My Cart")
        .padding(.top)
    }
}
