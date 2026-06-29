//
//  AppetizerListCell.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 19/08/2025.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer : Appetizer
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 90, alignment: .center)
                .cornerRadius(18)
           
            VStack(alignment: .leading, spacing: 3){
                Text(appetizer.name)
                    .font(.title2)
                    .lineLimit(2)
                    .fontWeight(.medium)
                
                
                Text("$ \(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }.padding(.leading)
            
        }
    }
}
    
#Preview {
    AppetizerListCell(appetizer: MockData.mock)
}
