//
//  SplashView.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 13/04/23.
//

import SwiftUI

struct SplashView: View {
    
    @State private var size = 0.8
    @State private var opacity = 0.7
    
    var body: some View{
        Image("splash")
            .resizable()
            .scaledToFill()
        VStack(alignment: .leading){
            Text("Viñedos")
                .font(.system(size: 40))
                .bold()
            Text("La Redønda")
                .font(.system(size: 50))
                .fontWeight(.heavy)
                
        } // VS
        .foregroundColor(.primary)
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear{
            withAnimation(.easeIn(duration: 4)){
                self.size = 0.9
                self.opacity = 1.0
            }
        }
    }
}

