//
//  NurseAPI.swift
//  AttentionApp
//
//  Created by JEAN PIERRE HUAPAYA CHAVEZ on 11/10/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct NurseAPI {
   static func viewAll(completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.get("v1/nurses", method: .get) { res in
        switch res {
        case .success:
            if let nurses = res.value {
              completion(.success(nurses))
            }
        case let .failure(error):
          completion(.failure(error))
        }
      }
    }
    
    

    static func detailsNurse(_ parameters: Parameters?,completion: @escaping (Result<JSON>)-> Void){
        RequestAPI.call("v1/nurses/{id}", method: .get, parameters: parameters){ res in
            switch res {
            case .success:
                if let nurseDetail = res.value{
                    completion(.success(nurseDetail))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}

