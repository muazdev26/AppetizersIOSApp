//
//  OrderView.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 18/08/2025.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    List{
                        ForEach(order.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }.onDelete(perform:  order.remove)
                    }.listStyle(PlainListStyle())
                    
                    Button{
                        
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }.modifier(StandardButtonStyle()).padding(.bottom, 20)
            }
                if(order.items.isEmpty){
                    EmptyStateView(imageName: "empty-order", message: "Your order is empty")
                }
            }.navigationTitle("🧾 Order")
        }
    }

}



#Preview {
    OrderView()
}
