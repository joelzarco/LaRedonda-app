//
//  PaymentButton.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 26/04/23.
//

import SwiftUI
import PassKit

struct PaymentButton: View {
    var action : () -> Void
    
    var body: some View {
        Representable(action: action)
            .frame(minWidth: 100, maxWidth: 400) // frames requiered by apple HIG's
            .frame(height: 45)
            .frame(maxWidth: .infinity)
    }
}

extension PaymentButton{
    
    struct Representable : UIViewRepresentable{
        //wrapper for uikit's stuff
        var action : () -> Void
        // requiered methods
        func makeCoordinator() -> Coordinator {
            Coordinator(action : action)
        }
        
        func makeUIView(context: Context) -> some UIView {
            context.coordinator.button
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action
        }
    }
    
    class Coordinator : NSObject{
        var action : () -> Void
        var button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
        
        
        init(action: @escaping () -> Void) {
            self.action = action
            super.init()
            
            button.addTarget(self, action: #selector(callback(_:)), for: .primaryActionTriggered)
        }
        
        @objc func callback(_ sender : Any){
            print("PaymentButton tapped")
            action()
        }
    }
}

