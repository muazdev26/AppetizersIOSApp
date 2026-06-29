//
//  AppetizerListViewModel.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 20/08/2025.
//

import Foundation

final class AppetizerListViewModel : ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = true
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.isLoading = false
                    self.appetizers = appetizers
                case .failure(let error):
                    self.isLoading = false
                    switch error {
                    case .invalidData:
                        self.alertItem = Alertcontext.invalidData
                    case .invalidURL:
                        self.alertItem = Alertcontext.invalidURL
                    case .invalidResponse:
                        self.alertItem = Alertcontext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = Alertcontext.unableToComplete
                    }
                }
            }
        }
    }
}
