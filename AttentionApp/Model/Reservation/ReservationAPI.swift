//
//  ReservationAPI.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/16/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct ReservationAPI{
 
    static func call(completion: @escaping (Result<JSON>)-> Void){
        RequestAPI.get("v1/reservations", method: .get){res in
            switch res{
            case .success:
                if let reservation = res.value {
                  completion(.success(reservation))
                }
            case let .failure(error):
              completion(.failure(error))
            }
            
        }
    }
    
    
}
