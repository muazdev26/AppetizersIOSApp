//
//  AppitizerListView.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 18/08/2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppitizerListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.appetizers){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }.onAppear(perform: viewModel.getAppetizers)
    }

}

#Preview {
    AppetizerListView()
}
