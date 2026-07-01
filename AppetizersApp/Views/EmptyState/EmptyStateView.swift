//
//  EmptyStateView.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 24/04/2026.
//

import SwiftUI

struct EmptyStateView: View {
    let imageName : String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
                
                Text(message)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
            }.offset(y: -50)
        }
    }
}

#Preview {
    EmptyStateView(imageName: "empty-order", message: "No items in your cart")
}
