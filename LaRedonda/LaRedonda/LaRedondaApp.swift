//
//  LaRedondaApp.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 06/04/23.
//

import SwiftUI

class AppState : ObservableObject{
    
    @Published var splashHasBeenShown : Bool = false
    
    init(splashHasBeenShown: Bool) {
        self.splashHasBeenShown = splashHasBeenShown
    }
}

@main
struct LaRedondaApp: App {
    
    @ObservedObject var appState = AppState(splashHasBeenShown : false)
    
    var body: some Scene {
        WindowGroup {
            if(appState.splashHasBeenShown){
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
                            appState.splashHasBeenShown = true
                        }
                    }
                }
            } //else

            
        } //wg
    } //som scn
}
