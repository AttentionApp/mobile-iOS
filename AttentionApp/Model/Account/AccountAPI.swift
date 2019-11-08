//
//  AccountAPI.swift
//  AttentionApp
//
//  Created by Ricardo Guevara on 11/4/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct AccountAPI {
  static func login(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/auth/login", method: .post, parameters: parameters) { res in
      switch res {
      case .success:
        if let json = res.value {
          UserDefaults.standard.set(json["token"].string, forKey: "token")
          completion(.success(json))
        }
      case let .failure(error):
        completion(.failure(error))
      }
    }
  }

  static func signup(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/auth/signup", method: .post, parameters: parameters) { res in
      switch res {
      case .success:
        if let json = res.value {
          UserDefaults.standard.set(json["token"].string, forKey: "token")
          completion(.success(json))
        }
      case let .failure(error):
        completion(.failure(error))
      }
    }
  }
}
