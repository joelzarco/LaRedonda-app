//
//  WineRow.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 11/04/23.
//

import SwiftUI

struct WineRow: View {
    @EnvironmentObject var cartManager : CartManager
    var product : Product
    
    var body: some View {
        
        HStack(spacing: 20) {
            Image(product.imageNames[0])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .center, spacing: 10){
                Text("Quantity:")
                    .font(.caption)
                // to allow orders > 1 in single wine
                if let q = cartManager.myProducts[product.name]{
                    Text("\(q)")
                        .font(.caption).bold()
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold()
                Text("$\(product.price)")
            }
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.pink)
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        } // hs
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


