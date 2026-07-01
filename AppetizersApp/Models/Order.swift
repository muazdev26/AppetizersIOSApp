//
//  Order.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 24/04/2026.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice : Double {
        items.reduce(0){ $0 + $1.price }
    }
    

    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func remove(at offsets : IndexSet){
        items.remove(atOffsets: offsets)
    }
}
