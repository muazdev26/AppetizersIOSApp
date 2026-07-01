//
//  AppetizerListViewModel.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 20/08/2025.
//

import Foundation
import Observation

@MainActor
@Observable
final class AppetizerListViewModel {

    var appetizers: [Appetizer] = []
    var alertItem: AlertItem?
    var isLoading = true
    var isShowingDetail = false
    var selectedAppetizer: Appetizer?

    func getAppetizers() {
        isLoading = true

        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidData
                }
            }

            isLoading = false
        }
    }
}
