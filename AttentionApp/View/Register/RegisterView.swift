//
//  RegisterView.swift
//  AttentionApp
//
//  Created by Ricardo Guevara on 11/7/19.
//  Copyright © 2019 Ricardo Guevara. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON


struct RegisterView: View {
    @EnvironmentObject private var globalState: GlobalState
    @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>
    
    @State private var email: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var password: String = ""
    let stringCrearCuenta : String = "Crear cuenta"
    
    func stateReset() {
        email = ""
        firstName = ""
        lastName = ""
        password = ""
    }
    
    
    var body: some View {
        VStack() {
            Image("ic_logo").resizable().frame(width: 180, height:150)
            Spacer()
                .frame(height: 50)
            Text("Crear cuenta")
                .bold()
                .font(.largeTitle)
            Text("Por favor, ingrese su nombre, email y contraseña").multilineTextAlignment(.center)
                .font(.subheadline)
            Spacer()
                .frame(height: 50)
            TextField("Nombres", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Apellidos", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.oneTimeCode)
                .keyboardType(.emailAddress)
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                let parameters: Parameters = [
                    "email": self.email,
                    "password": self.password,
                    "first_name": self.firstName,
                    "last_name":self.lastName
                ]
              AccountAPI.signup(parameters) { res in
                switch res {
                case .success:
                  if let json = res.value, let accessToken = json["token"].string {
                    self.globalState.accessToken = accessToken
                  }
//                  self.stateReset()
                  self.presentation.wrappedValue.dismiss()
                case let .failure(error):
                  print(error)
                }
              }
            }) {
                HStack {
                    
                    Text(stringCrearCuenta)
                        .fontWeight(.semibold)
                        .font(.callout)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.black)
                .background(Color.blue)
                .cornerRadius(40)
            }.padding(20)
            
        }
    .padding(48)
    }
}



struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environmentObject(GlobalState())
    }
}
