//
//  LaRedondaApp.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 06/04/23.
//

import SwiftUI

class AppState : ObservableObject{
    
    @Published var isSplashActive : Bool = false
    
    init(isSplashActive: Bool) {
        self.isSplashActive = isSplashActive
    }
}

@main
struct LaRedondaApp: App {
    
    @ObservedObject var appState = AppState(isSplashActive : false)
    
    var body: some Scene {
        WindowGroup {
            if(appState.isSplashActive){
                ContentView()
            }else{
                ZStack{
                    SplashView()
                }
                .statusBarHidden()
                .ignoresSafeArea()
                .preferredColorScheme(.dark)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                        withAnimation {
                            appState.isSplashActive = true
                        }
                    }
                }
            } //else
        } //wg
    } //som scn
}
