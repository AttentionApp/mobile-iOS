//
//  UserAPI.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/12/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct UserAPI{
    
    
    static func data(completion: @escaping (Result<JSON>)-> Void){
        RequestAPI.get("v1/auth/self", method: .get){res in
            switch res{
            case .success:
                if let user = res.value {
                  completion(.success(user))
                }
            case let .failure(error):
              completion(.failure(error))
            }
            
        }
    }
    
}
