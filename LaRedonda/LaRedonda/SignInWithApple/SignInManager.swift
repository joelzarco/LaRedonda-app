//
//  SignInManager.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 02/05/23.
//

import Foundation
import SwiftUI

class SignInManager : ObservableObject{
    
    @AppStorage("userId") var userId : String = ""
    @AppStorage("name") var name : String = ""
}
