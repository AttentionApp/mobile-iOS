//
//  NurseAPI.swift
//  AttentionApp
//
//  Created by Ricardo Guevara on 11/12/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct NurseAPI {
  static func findAll(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/nurses", method: .get, parameters: parameters, completion: completion)
  }

  static func create(_ parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    RequestAPI.call("v1/nurses", method: .post, parameters: parameters, completion: completion)
  }
}
