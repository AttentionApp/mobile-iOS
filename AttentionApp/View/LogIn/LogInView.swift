//
//  LogInView.swift
//  AttentionApp
//
//  Created by Ricardo Guevara on 11/4/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON


struct LogInView: View {
    @EnvironmentObject private var globalState: GlobalState
    @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>
    
    @State private var showModal = false
    @State private var email: String = ""
    @State private var password: String = ""
    
    var logInFormData: Parameters {
        [
            "email": email,
            "password": password,
        ]
    }
    
    
    var body: some View {
        VStack {
            Image("ic_logo")
            Text("LOG IN")
                .bold()
                .font(.largeTitle)
            Text("Attention App")
                .font(.subheadline)
            
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(48)
    
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView().environmentObject(GlobalState())
    }
}
