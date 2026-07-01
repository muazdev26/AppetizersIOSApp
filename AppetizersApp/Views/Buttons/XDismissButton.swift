//
//  XDismissButton.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 26/10/2025.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                .opacity(0.9)
                .padding()
            
            Image(systemName: "xmark")
                .imageScale(.large)
                .frame(width: 44, height: 44)
                .tint(.black)
        }
    }
}

#Preview {
    XDismissButton()
}
