//
//  AppetizerDetailsView.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 30/08/2025.
//

import SwiftUI


struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail : Bool
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 225)
                .cornerRadius(18)
                .shadow(radius: 20)
            
            Spacer()
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .bold()
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 45){
                    NutritionInfoCell(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfoCell(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfoCell(title: "Protein", value: "\(appetizer.protein) g")
                }
                
            }
            
            Button(action: {
                order.add(appetizer)
                isShowingDetail = false
            }) {
                Text("$\(appetizer.price, specifier: "%.2f")- Add To Order")
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom)
            
        }.frame(width: 320, height: 520  )
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 40)
            .overlay(Button(action: {
                isShowingDetail = false
            }) {
               XDismissButton()
            }.padding(.bottom), alignment: .topTrailing)
    }
}


#Preview {
    AppetizerDetailView(appetizer: MockData.mock, isShowingDetail: .constant(false))
}
