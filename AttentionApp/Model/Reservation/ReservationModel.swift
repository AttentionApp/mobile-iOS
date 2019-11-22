//
//  Reservation.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/16/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Foundation
import SwiftUI


struct ReservationModel : Identifiable, Codable {
    
    let id = UUID()
    var idNurse: Int
    var start_date: String
    
    init(){
        idNurse = 0
        start_date = "No date"
    }
    
}
