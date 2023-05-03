//
//  LaRedondaApp.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 06/04/23.
//

import SwiftUI

class AppState : ObservableObject{
    
    @Published var hasOnboarded : Bool = false
    @Published var HasSignedWithApple : Bool = false
    @Published var continueAsGuest : Bool = false
    @Published var isSplashActive : Bool = false
    
//    init(isSplashActive: Bool) {
//        self.isSplashActive = isSplashActive
//    }
}

@main
struct LaRedondaApp: App {
    
    @ObservedObject var appState = AppState()
    @ObservedObject var signInManager = SignInManager()
    
    var body: some Scene {
        WindowGroup {
            if(appState.isSplashActive){
                // ->
                            if(appState.hasOnboarded && !signInManager.userId.isEmpty){  // not empty userID means it's already signed in
                                LaRedondaMain()
                                    .environmentObject(appState)
                                    .environmentObject(signInManager)
                            } else if(appState.hasOnboarded && appState.continueAsGuest){ // onboarded and guest
                                withAnimation(.easeInOut(duration: 4)) {
                                    LaRedondaMain()
                                        .environmentObject(appState)
                                        .environmentObject(signInManager)
                                }
                            }
                            else{
                                Onboarding()
                                    .environmentObject(appState)
                                    .environmentObject(signInManager)
                            }
                            // -> onboarding and signing
            }else{
                ZStack{
                    SplashView()
                } // ZS
                .preferredColorScheme(.dark)
                .statusBarHidden()
                .ignoresSafeArea()
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline : .now() + 4) {
                        withAnimation {
                            appState.isSplashActive = true
                        }
                    }
                } // .onAppear()
            } // outter else
        } // Wg
    } // some scn
}
