//
//  User.swift
//  EcommerceIOSApp
//
//  Created by Muaz on 13/01/2026.
//

import Foundation


struct User : Codable {
    var firstName = ""    
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
