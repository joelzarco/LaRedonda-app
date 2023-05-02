//
//  Onboarding.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 01/05/23.
//

import SwiftUI

struct Onboarding: View {
    
    @EnvironmentObject var appState : AppState
    
    @State private var pageIndex = 0
    private let pages : [Page] = Page.onboardPages
    
    @EnvironmentObject var signInManager : SignInManager // for future signInwithApple
    private var hasSignIn : Bool{
        return !signInManager.userId.isEmpty
    }
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                ZStack(alignment: .bottom){
                    PageView(page: page)
                        if(page == pages.last){
                            if(!hasSignIn){
                                VStack{
//                                    SignInButtonView()
//                                        .environmentObject(signInManager)
//                                        .environmentObject(appState)
//                                        .padding(.leading, 40)
//                                        .padding(.trailing, 40)
                                    
                                    Button("Continue as guest"){
                                        appState.continueAsGuest = true
                                    }
                                    .buttonStyle(.plain)
                                    .font(.body)
                                    .bold()
                                    .padding(.bottom, 50)
                                }
                            }
//                            else{
//                                WelcomeView().environmentObject(signInManager)
//
//                            }
                        } // ifLast
                } // outterZ
                .onAppear{
                    logTag(tag: page.tag)
                }
                .tag(page.tag)
            } // forE
        } // tabV
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .preferredColorScheme(.dark)
        .ignoresSafeArea()
        .statusBarHidden()
    }
    
    func logTag(tag : Int){
//        print("tag number \(tag)")
        if(tag == 3){
            appState.hasOnboarded = true
        }
    }
}
