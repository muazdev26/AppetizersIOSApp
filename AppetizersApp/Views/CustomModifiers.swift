//
//  CustomModifires.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 27/06/2026.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(ControlSize.large)
    }
}


struct StandardImageStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: 120, height: 90, alignment: .center)
            .cornerRadius(18)
            .shadow(radius: 20)
    }
}
