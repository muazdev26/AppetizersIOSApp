//
//  AlertItem.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 20/08/2025.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable, Sendable {
    let id = UUID()
    let title: String
    let message: String
    let buttonTitle: String
}

struct AlertContext {

    // MARK: - Network Errors

    static let invalidData = AlertItem(
        title: "Server Error",
        message:
            "The data received from the server is invalid. Please contact the support team.",
        buttonTitle: "OK"
    )

    static let invalidResponse = AlertItem(
        title: "Server Error",
        message:
            "Invalid response from the server. Please contact the support team.",
        buttonTitle: "OK"
    )

    static let invalidURL = AlertItem(
        title: "Server Error",
        message:
            "There was an error connecting to the server. Please check your internet connection and try again.",
        buttonTitle: "OK"
    )

    static let unableToComplete = AlertItem(
        title: "Server Error",
        message: "Unable to complete the request. Please try again later.",
        buttonTitle: "OK"
    )

    // MARK: - Account Alerts

    static let invalidForm = AlertItem(
        title: "Invalid Form",
        message:
            "All fields are required. Please fill in all the required fields.",
        buttonTitle: "OK"
    )

    static let invalidEmail = AlertItem(
        title: "Invalid Email",
        message: "Please enter the correct email address.",
        buttonTitle: "OK"
    )

    static let userSaved = AlertItem(
        title: "Profile Saved Successfully",
        message: "All your personal information has been saved successfully.",
        buttonTitle: "OK"
    )

    static let userSavedFailure = AlertItem(
        title: "Profile Error",
        message:
            "There was an error saving your profile. Please try again later.",
        buttonTitle: "OK"
    )
}
