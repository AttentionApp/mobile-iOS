//
//  CardModel.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/21/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Foundation
import SwiftUI


struct CardModel : Identifiable, Codable {
    
    let id = UUID()
    var idCard: Int
    var account_number: String
    
    init(){
        account_number = ""
        idCard = 0
    }
    
}
