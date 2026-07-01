//
//  AccountViewModel.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 26/10/2025.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {

    @AppStorage("user") private var userData: Data?

    @Published var user: User = User()

    @Published var alertItem: AlertItem?

    var isValidForm: Bool {
        guard
            !user.firstName.isEmpty && !user.lastName.isEmpty
                && !user.email.isEmpty
        else {
            alertItem = AlertContext.invalidForm
            return false
        }

        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }

    func saveChanges() {
        guard isValidForm else {
            return
        }

        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaved
        } catch {
            alertItem = AlertContext.userSavedFailure
            #if DEBUG
                print("Error saving user data: \(error)")
            #endif
        }
    }

    func loadUserData() {
        if let data = userData {
            do {
                user = try JSONDecoder().decode(User.self, from: data)
            } catch {
                #if DEBUG
                    print("Error loading user data: \(error)")
                #endif
            }
        }
    }

}
