//
//  GlobalState.swift
//  AttentionApp
//
//  Created by Ricardo Guevara on 11/4/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import SwiftUI

final class GlobalState: ObservableObject {
  @Published var accessToken: String = UserDefaults.standard.string(forKey: "access_token") ?? ""
}
