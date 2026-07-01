//
//  Appetizer.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 18/08/2025.
//

import Foundation

struct Appetizer : Decodable, Identifiable {
    let id : Int
    let name : String
    let description : String
    let price: Double
    let imageURL: String
    let protein: Int
    let calories: Int
    let carbs: Int
}

struct AppetizerResponse : Decodable {
    let request: [Appetizer]
}
struct AppetizerDTO : Decodable {
    let record: AppetizerResponse
}

struct MockData{
    static let mock = Appetizer(
        id: 1,
        name: "Asian Flank Steak",
        description: "Marinated flank steak grilled with Asian spices and served with jasmine rice and vegetables.",
        price: 15.99,
        imageURL: "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
        protein: 35,
        calories: 420,
        carbs: 50
    )
    
    static let appetizers: [Appetizer] = [mock, mock, mock]
    static let mockOrderItems: [Appetizer] = [orderItemOne, orderItemTwo, orderItemThree]
    
    static let orderItemOne = Appetizer(
        id: 1,
        name: "Asian Flank Steak one",
        description: "Marinated flank steak grilled with Asian spices and served with jasmine rice and vegetables.",
        price: 15.99,
        imageURL: "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
        protein: 35,
        calories: 420,
        carbs: 50
    )
    
    static let orderItemTwo = Appetizer(
        id: 2,
        name: "Asian Flank Steak two",
        description: "Marinated flank steak grilled with Asian spices and served with jasmine rice and vegetables.",
        price: 15.99,
        imageURL: "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
        protein: 35,
        calories: 420,
        carbs: 50
    )
    
    
    static let orderItemThree = Appetizer(
        id: 3,
        name: "Asian Flank Steak three",
        description: "Marinated flank steak grilled with Asian spices and served with jasmine rice and vegetables.",
        price: 15.99,
        imageURL: "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
        protein: 35,
        calories: 420,
        carbs: 50
    )
}
