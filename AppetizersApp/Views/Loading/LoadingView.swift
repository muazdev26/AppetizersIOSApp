//
//  LoadingView.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 26/08/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
                .tint(Color(.brandPrimary))
        }
    }
}
