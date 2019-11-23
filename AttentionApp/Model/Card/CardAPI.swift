//
//  CardAPI.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/21/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct CardAPI{
 
    static func call(idCard: Int,completion: @escaping (Result<JSON>)-> Void){
        RequestAPI.get("v1/customers/\(idCard)/reservations", method: .get){res in
            switch res{
            case .success:
                if let card = res.value {
                  completion(.success(card))
                }
            case let .failure(error):
              completion(.failure(error))
            }
            
        }
    }
    
    
}
