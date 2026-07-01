//
//  EcommerceIOSAppApp.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 18/08/2025.
//

import SwiftUI

@main
struct EcommerceIOSApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppTabView().environmentObject(order)
        }
    }
}
