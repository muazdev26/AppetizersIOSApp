//
//  ContentView.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 18/08/2025.
//

import SwiftUI

struct AppTabView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
    }
}

#Preview {
    AppTabView()
}
