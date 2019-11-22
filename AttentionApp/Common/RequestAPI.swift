//
//  RequestAPI.swift
//  AttentionApp
//
//  Created by Ricardo Guevara on 11/4/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON
//import AlamofireImage

struct RequestAPI {
  static func call(_ path: String, method: HTTPMethod, parameters: Parameters?, completion: @escaping (Result<JSON>) -> Void) {
    let baseURL = URL(string: "https://attention-api.herokuapp.com/api/")
    let url = baseURL!.appendingPathComponent(path)
    let accessToken = UserDefaults.standard.string(forKey: "token") ?? ""
    let successAPI = UserDefaults.standard.string(forKey: "success") ?? ""
    let headers: HTTPHeaders = ["Authorization": "Bearer \(accessToken)"]
    Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { res in
      switch res.result {
      case .success:
        if let value = res.result.value {
          let json = JSON(value)
          completion(.success(json))
        }
      case let .failure(error):
        print(error.localizedDescription)
        completion(.failure(error))
    if successAPI == "" {
            print (error.localizedDescription)
        }
      }
    }
  }
    
    static func get(_ path: String, method: HTTPMethod, completion: @escaping (Result<JSON>) -> Void){
        let baseURL = URL(string: "https://attention-api.herokuapp.com/api/")
        let url = baseURL!.appendingPathComponent(path)
        let accessToken = UserDefaults.standard.string(forKey: "token") ?? ""
        let headers: HTTPHeaders = ["Authorization": "Bearer \(accessToken)"]
        
        Alamofire.request(url,method: method, encoding: JSONEncoding.default, headers: headers).responseJSON{res in
            switch res.result {
            case .success:
              if let value = res.result.value {
                let json = JSON(value)
                completion(.success(json))
              }
            case let .failure(error):
              print(error.localizedDescription)
              completion(.failure(error))
            }

        }
    }
    
//    static func converterImage(){
//
//        Alamofire.request("https://www.cuantogana10.com/wp-content/uploads/2015/07/enfermera.jpg").responseImage{ response in
//            debugPrint(response)
//
//            print(response.request)
//            print(response.response)
//            debugPrint(response.result)
//
//            if let image = response.result.value {
//                print("image downloaded: \(image)")
//            }
//
//        }
//    }
}
