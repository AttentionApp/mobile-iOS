//
//  NurseDetail.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/11/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI

struct NurseDetail:Decodable {
    
    let name: String
    let lastName: String
    let imageURL: String
    let code: String
    
    init(){
        self.name=""
        self.imageURL=""
        self.lastName=""
        self.code=""
    }
}
