//
//  PageView.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 29/04/23.
//

import SwiftUI

struct PageView: View {
    var page : Page
    var body: some View {
        ZStack{
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFill()

        }.ignoresSafeArea()
    }
}
