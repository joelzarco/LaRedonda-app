//
//  WineCard.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 08/04/23.
//

import Foundation
import SwiftUI

struct WineCard: View {
    @EnvironmentObject var cartManager : CartManager
    var product : Product
    let wineWidth : CGFloat = 170
    
    var body: some View {
        ZStack(alignment : .topTrailing){
            ZStack(alignment: .bottom) {
                Image(product.imageNames[0])
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: wineWidth)
                    .scaledToFit()
                
                VStack(alignment: .center) {
                    Text(product.name)
                        .bold()
                        .font(.subheadline)
                    Text("$\(product.price).00")
                        .font(.caption)
                } // vs
                .padding()
                .frame(width: wineWidth)
                .background(.ultraThinMaterial)
                .cornerRadius(20)// to match upper radius
            } // inner zs
            .frame(width: wineWidth, height: 250)
            .shadow(radius: 3)
            // add to cart button
            Button{
                print("add to cart button tapped")
                // later call here cart manager
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding(5)
            }
        } // outter zs
    }
}
