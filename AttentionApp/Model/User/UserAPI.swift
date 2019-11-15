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
    
    static func data(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void){
        RequestAPI.call("v1/auth/self", method: .get, parameters: parameters){res in
            switch res{
                case .success:
                    if let json = res.value {
                        completion(.success(json))
                      }
                case let .failure(error):
                  completion(.failure(error))
            }
        
        }
    }
    
}
