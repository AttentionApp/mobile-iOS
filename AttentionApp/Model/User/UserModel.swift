//
//  UserModel.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/14/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI

struct UserModel : Identifiable, Codable {
    
    let id = UUID()
    var idcustomer: Int
    var first_name: String
    var last_name: String
    var short_name : String
    var thumbnail_image : String
    var email: String
    
    init(){
        idcustomer = 0
        short_name = "No name"
        thumbnail_image = "No URL"
        first_name = "No name"
        last_name = "No last name"
        email = "No email"
        
    }
    
}
