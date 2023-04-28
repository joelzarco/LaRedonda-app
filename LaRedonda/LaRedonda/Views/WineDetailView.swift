//
//  WineDetailView.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 11/04/23.
//

import SwiftUI

struct WineDetailView: View {
    
    @EnvironmentObject var cartManager : CartManager
    var product : Product
    
    var body: some View {
        // from Zstack to VS to just scrll
            ScrollView {
                TabView{
                    ForEach(0..<product.imageNames.count){ i in
                        Image("\(product.imageNames[i])")
                            .resizable()
                            .cornerRadius(10)
                            .scaledToFit()
                            .frame(width: 350)
                    } //fr
                } // tabV
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .frame(height: 400)
                Group{
                    HStack{
                        VStack{
                            Text("Cepa:")
                                .bold()
                                .font(.body)
                            Text(product.cepa)
                                .font(.caption)
                        }
                        VStack{
                            Text("Crianza:")
                                .font(.body).bold()
                            Text(product.crianza)
                                .font(.caption)
                        }
                        VStack{
                            Text("Pres:").font(.body).bold()
                            Text(product.presentacion)
                                .font(.caption)
                        }
                    }
                    
                    Button("Add to cart"){
                        cartManager.addToCart(product: product)
                    }
                    .buttonStyle(.bordered).bold()
                    .cornerRadius(10)
                    .padding(10)
                    .foregroundColor(.primary)
                    
                    Spacer(minLength: 5)
                    VStack(alignment: .leading){
                        Text(product.descripcion)
                            .font(.body)
                            .frame(width: 350)
                            .allowsTightening(true)
                            .truncationMode(.middle)
                            .padding(.top)
                    }
                    Spacer()
                    VStack(alignment : .leading){
                        Text("Vista:")
                            .bold()
                        Text(product.vista)
                        
                        Text("Nariz:")
                            .bold()
                        Text(product.nariz)
                        
                        Text("Boca:")
                            .bold()
                        Text(product.boca)
                    }.frame(width: 350)
                        .allowsTightening(true)
                        .truncationMode(.middle)
                        .padding(.top)
                    HStack{
                        VStack{
                            Text("Temp. de consumo:")
                                .bold()
                            Text(product.temperatura)
                                .font(.caption)
                        }
                        VStack{
                            Text("Graduacion:")
                                .bold()
                            Text(product.graduacion)
                                .font(.caption)
                        }
                    }
                    .padding(.top)
                    VStack(alignment: .leading) {
                        Text("Sinergia gastronomica sugerida:")
                            .bold()
                        Text(product.gastronomia)
                            .allowsTightening(true)
                            .truncationMode(.middle)
                    }
                    .padding(.top)
                    Spacer()
                    HStack{
                        Text("Precio: $\(product.price).00 MXN")
                            .bold()
                    }
                    .padding(.top)
                } // Grp too avoid 'too many index' error
                //
                

            } // Scroll
            .navigationTitle("\(product.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink{
                    CartView().environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            } // toolB
    } // someV
} // main

