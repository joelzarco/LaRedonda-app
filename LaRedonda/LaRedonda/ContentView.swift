//
//  ContentView.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 06/04/23.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var cartManager = CartManager()
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20){
                    Section{
                        ForEach(tintoList, id: \.id){ product in
                            NavigationLink{
                                WineDetailView(product: product).environmentObject(cartManager)
                            } label: {
                                WineCard(product: product).environmentObject(cartManager)
                            }.foregroundColor(.primary) // to avoid accent
                        }
                    } header: {
                        Text("Tinto")
                            .font(.title2)
                            .bold()
                    }
                    
                    Section{
                        ForEach(espumosoList, id: \.id){ product in
                            NavigationLink{
                                WineDetailView(product: product).environmentObject(cartManager)
                            } label: {
                                WineCard(product: product).environmentObject(cartManager)
                            }.foregroundColor(.primary)
                        }
                    } header: {
                        Text("Espumoso")
                            .font(.title2)
                            .bold()
                    }
                    
                    Section{
                        ForEach(blancoList, id: \.id){ product in
                            NavigationLink{
                                WineDetailView(product: product).environmentObject(cartManager)
                            } label: {
                                WineCard(product: product).environmentObject(cartManager)
                            }.foregroundColor(.primary)
                        }
                    } header: {
                        Text("Blanc")
                            .font(.title2)
                            .bold()
                    }
                    
                    Section{
                        ForEach(roseList, id: \.id){ product in
                            NavigationLink{
                                WineDetailView(product: product).environmentObject(cartManager)
                            } label: {
                                WineCard(product: product).environmentObject(cartManager)
                            }.foregroundColor(.primary)
                        }
                    } header: {
                        Text("Rosé")
                            .font(.title2)
                            .bold()
                    }
                } // lazyV
                .padding()
            } // scrllV
            .navigationTitle("Viñedos LaRedonda")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                NavigationLink{ // dest
                    CartView().environmentObject(cartManager)
                } label: { // origin
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            } // tool
        } // nav
        .preferredColorScheme(.dark)
    } // someV
}


