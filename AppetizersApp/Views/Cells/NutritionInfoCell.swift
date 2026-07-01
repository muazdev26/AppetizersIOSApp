//
//  NutritionInfoView.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 30/08/2025.
//

import SwiftUI


struct NutritionInfoCell: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
                .font(.body)
        }
    }
}
