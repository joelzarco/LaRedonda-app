//
//  SignInButton.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 02/05/23.
//

import SwiftUI
import AuthenticationServices

struct SignInButtonView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var signInManager : SignInManager
    @EnvironmentObject var appState : AppState
    
    var body: some View {
        
        SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.fullName]
        } onCompletion: { result in
            switch result{
            case .success(let auth):
                switch auth.credential{
                case let credential as ASAuthorizationAppleIDCredential:
                    // cached to backend or local
                    let name = credential.fullName?.givenName
                    let userId = credential.user // received on re install
//                    let mail = credential.email
                    signInManager.name = name ?? ""
                    signInManager.userId = userId
//                    appState.hasOnboarded = true
                    appState.HasSignedWithApple = true
//                    signInManager.email = mail ?? ""
                default:
                    break
                }
            case .failure(let error):
                print(error.localizedDescription)
                appState.continueAsGuest = true
            }
        }
        .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
        .frame(height: 50)
//        .padding()
        .cornerRadius(10)
    }
}

