//
//  NurseModel.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/10/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI

struct NurseModel : Identifiable, Codable {
    
    let id = UUID()
    var idnurse: Int
    var first_name: String
    var last_name: String
    var short_name : String
//    let code_identification: String
//    let gender : String
//    let qualification : String
    var thumbnail_image : String
//    let comment : String
//    let description : String
//    let active : Bool
//    let created_by : String
//    let create_date : Date
//    let modified_by : String
//    let modify_date : String
//    let deleted_by : String
//    let delete_date : String
//    let idnursetype : Int
    
    init(){
        short_name = "No name"
        thumbnail_image = "No URL"
        first_name = "No name"
        last_name = "No last name"
        idnurse = 0
    }
    
}
