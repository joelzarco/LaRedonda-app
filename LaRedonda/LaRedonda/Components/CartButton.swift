//
//  CartButton.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 10/04/23.
//

import SwiftUI

struct CartButton: View {
    
    var numberOfProducts : Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart") // from SFSymbols
                .padding(.top, 4)
            if(numberOfProducts > 0){
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(.pink)
                    .cornerRadius(50) // full circle
            }
        }
    }
}


